dirname = File.dirname(__FILE__)
csv_dir = File.expand_path("../events/" , dirname)
players_dir = File.expand_path("../players/" , dirname)

require 'csv'
require File.join(dirname, "names.rb") 
require File.join(dirname, "cpt.rb")

begin
  tour = CPT.new(Name_List, Clan_List)
  tour.seed_players(Seed_List)
  
  # Process CSV in order
  Dir.entries(csv_dir).sort.each do |csv_name|
    next if [".",".."].include?(csv_name)  #skip non-files
    event_name = csv_name[6..-5]
    csv_file = File.join(csv_dir, csv_name)
    csv = CSV.read(csv_file, :headers => true, :header_converters => :downcase, :converters => :all)
    csv.each do |row|
      match = row.to_hash
      tour.add_match(event_name, match)
    end
  end
  
  output = File.open(dirname + "/output.csv","w")
  output.puts "Player,Elo,Games,Wins,Loss,%,Attended,Tournaments"
  tour.players.values.sort_by{|player| -player.elo.rating}.each do |p|
    next if (p.wins + p.loss) == 0 # skip players with no games (players created during seeding)
    output.puts p.get_stats.join(",")
    #Write player card if rating > 1500
    p.write_player(File.open(File.join(players_dir, "#{p.id_string.gsub("/","-")}.txt"), 'w'))
  end
end
