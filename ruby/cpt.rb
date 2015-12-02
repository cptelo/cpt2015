require 'set'
require 'elo'

Elo.configure do |config|
  config.default_rating = 1500
  config.k_factor(25) { games_played < 15 }
  config.default_k_factor = 10
  config.use_FIDE_settings = false
end

class CPT_Player
  attr_accessor :name, :clan, :tournaments, :elo, :wins, :loss
  
  # params: name  - string of normalized player name
  def initialize(name)
    @name = name
    @clan = Set.new
    
    @tournaments = Hash.new{|h,k| h[k] = []}  #Hash of "tournament name" => [games]
    @wins = 0
    @loss = 0
    
    @elo = ::Elo::Player.new()
    
  end
  
  #Returns <name> or <clan>|<name>
  def id_string()
    return @name if @clan == Set.new
    return @clan.to_a.join("|") + "|" + @name
  end
  
  #Returns array of player stats
  def get_stats()
    name = id_string()
    elo = @elo.rating
    games = (@wins + @loss)
    wins = @wins
    loss = @loss
    percent = (@wins * 100)/games if games != 0
    percent = 0 if games == 0
    attended = @tournaments.size
    tournaments = @tournaments.keys.join(";")
    
    return [name, elo, games, wins, loss, percent, attended, tournaments]
  end
  
  def write_player(output)
    
    output.puts "Player: #{id_string}"
    output.puts "Rating: #{@elo.rating}"
    output.puts "Played: #{@wins + @loss}"
    output.puts "Won: #{@wins}"
    output.puts "Lost: #{@loss}"
    output.puts "%: #{(@wins * 100)/(@wins + @loss)}" if (@wins + @loss > 0)
    output.puts 
    output.puts "Results:"
    @tournaments.each do |event, games|
      output.puts "::::#{event}::::"
      games.each do |g|
        output.puts g
      end
    end
    output.close
  end
  
end

class CPT
  attr_accessor :players

  # params: name_list - hash for normalizing names
  #         clan_list - hash for normalizing clans
  def initialize(name_list, clan_list)
    @players = Hash.new{|h,k| h[k] = CPT_Player.new(k)}
    @names = normalizer(name_list)
    @clans = normalizer(clan_list)
  end
  
  #Seeds players ratings according to seed_list
  # params: seed_list - hash of rating => [player names]
  def seed_players(seed_list)
    seed_list.each do |rating, seeded|
      seeded.each do |name|
        p = get_player(name)
        p.elo = ::Elo::Player.new(:rating => rating, :pro => true)
      end
    end
  end
  
  #Returns hash for normalizing names
  # param:  names_list  - hash of "normalized name" => ["id1", "id2"]
  def normalizer(names_list)
    hash = Hash.new{|h,k|h[k]= k}
    names_list.each do |normalized, raw|
      raw.each do |id|
        hash[id] = normalized
      end
    end
    return hash
  end
  
  #Returns player based on normalized name, and checks clan
  # param:  string - string of player name
  def get_player(string)
    arr = string.split("|")
    name = @names[arr.last.strip.downcase]
    player = @players[name]
    #Check clan
    tags = arr.size
    while tags > 1
      clan = @clans[arr[-tags].strip.downcase]
      #add to player's clan set
      player.clan << clan
      tags -= 1
    end
    return player
  end
  
  #Adds match
  # params: tournament  - string of tournament name
  #         match       - hash of match with "winner", "rounds", "loser" as keys
  def add_match(tournament, match)
    winner = get_player(match["winner"].to_s)
    loser = get_player(match["loser"].to_s)
    
    game = winner.elo.wins_from(loser.elo)
    
    winner.tournaments[tournament] << "defeated #{loser.id_string} (#{loser.elo.rating})"
    loser.tournaments[tournament] << "lost to #{winner.id_string} (#{winner.elo.rating})"
    
    winner.wins += 1
    loser.loss += 1
      
  end
  
end