# CPT ELO

Match logs for CPT events and scripts for normalizing player identies and generating ELO statistics.

Results are in */ruby/output.csv* and the */players/* directory.

Uses the Elo gem from - https://github.com/iain/elo

Default Elo rating is 1500. K-factor is set to start at 25 and drop to 10 after 10 games.

Match logs were mostly generated from Challonge or Eventhubs results. They are not accurate. Sources for each event are provided below. Contains 7876 matches.

The data is far from perfect, so please reach out with any fixes to the match logs or the name normalization. Particularly if you can help with normalizing the Asian player names.

### Files:
- **/event/** - event match log CSV.
  - saved as "*MM-DD Event Name*.csv"
  - header: "*winner, rounds, loser*"
- **/ruby/** - Ruby files.
- **/ruby/cpt.rb** - Class files for *CPT* and *CPT_Player*.
- **/ruby/names.rb** - Normalization hashes for names and clans.
- **/ruby/run.rb** - Execution script.
  - creates */output.csv* containing player statistics.
  - creates player cards in */players/* for top players (rating > 1500).
- **/ruby/output.csv** - The results after running on the event logs.
- **/players/** - Player card TXT files.
  - saved as "*rating* - *Player Name*"
  - contains: Name, Rating, Played, Won, Loss, %, and Results.

### Sources:
02-27 Cannes Winter Clash
- http://gameslines.challonge.com/CWC2015USF4SoloBracket

03-07 Abuget Cup
- http://toughcookietv.challonge.com/abugetcup

03-15 Nine States Tournement
- http://toughcookietv.challonge.com/

03-20 Final Round
- http://www.eventhubs.com/news/2015/mar/20/final-round-18-live-stream-ft-daigo-momochi-xian-infiltration-fuudo-bonchan-kazunoko-gamerbee-snake-eyez-smug-tokido-pr-balrog-and-more/

04-03 Hypespotting 4
- http://hs4.challonge.com/

04-04 NorCal Regionals
- http://ncr2015.challonge.com/

04-24 Northwest Majors
- http://nwm7.challonge.com/

04-25 Double Elimination (CPTA Qualifier - Korea)
- http://gamestartasia.challonge.com/?page=4

05-04 KSB
- http://challonge.com/KSB2015_USF4

05-08 Texas Showdown
- http://txshowdown.challonge.com/

05-21 Combo Breaker
- http://combobreaker.challonge.com/

05-24 Stunfest
- http://stunfest2015.challonge.com/usf4solotop16

05-29 FFM-Rumble
- http://www.eventhubs.com/news/2015/may/30/ffm-rumble-2015-live-stream-ft-luffy-bonchan-tokido-poongko-valmaster-andreas-pro-fluke-ebi-dark-jiewa-halibel-rmz-momi-starnab-and-more/

06-13 Dremhack Summer
- http://challonge.com/dhs15usf4poolsreal

06-19 South East Asia Major
- http://gamestartasia.challonge.com/seam15usfivtop32/

06-26 CEO
- http://ceogaming.challonge.com/

07-17 EVO
- http://www.eventhubs.com/news/2015/jul/17/evo-2015-live-stream-ft-daigo-momochi-luffy-mago-xian-kazunoko-justin-wong-chrisg-mango-leffen-zero-sonicfox-ogawa-jdcr-cd-jr-and-more/

07-31 CPTA Shanghai
- http://gamestartasia.challonge.com/

08-08 VS Fighting V
- http://challonge.com/users/electronicdojo

08-09 FV Cup
- http://fvcup2015.challonge.com/

08-22 Taiwan Fighting Game Major
- http://twfm.challonge.com/

08-28 Summer Jam
- http://bigegaming.challonge.com/sj9usf4top32

08-29 Hong Kong Esports Tournament
- http://gamestartasia.challonge.com/

09-04 Manila Cup
- http://manilacup.challonge.com/

09-05 First Attack
- http://fa2015.challonge.com/

09-11 The Fall Classic
- http://thefallclassic.challonge.com/

09-12 Saigon Cup
- http://sfvietnam.challonge.com/

09-20 Tokyo Game Show
- http://www.eventhubs.com/news/2015/sep/18/mad-catz-tgs-2015-tournament-live-stream-ft-daigo-mago-infiltration-tokido-kazunoko-gamerbee-snake-eyez-nemo-fuudo-pr-balrog-uryo-and-more/

09-23 KO Fighting Game Festival
- http://challonge.com/users/whitetowerq8

09-26 EGX
- http://unequalledmedia.challonge.com/egx2015/

09-27 Call of Ragnarok
- http://challonge.com/CPTOSLO/

10-03 Red Fight District
- http://challonge.com/RFDIV_USF4/

10-04 Ze Fighting Game Champion
- http://gamestartasia.challonge.com/

10-06 So Cal Regionals
- http://levelup.challonge.com/scr2015_usf4/

10-10 CPT Brazil
- http://www.eventhubs.com/news/2015/oct/10/capcom-pro-tour-brazil-live-stream-ft-pepeday-haitani-chuchu-brenof1ght3rs-brunof1ght3rs-and-more/

10-17 Ultra Hyakkishu Cup
- http://challonge.com/UHCup

10-23 Milan Games Week
- http://challonge.com/MILAN2015USF4

10-24 Defend the North
- http://www.eventhubs.com/news/2015/oct/24/defend-north-2015-live-stream-ft-sonicfox-dieminion-snake-eyez-nuckledu-smug-problem-x-justin-wong-ricki-ortiz-cd-jr-honeybee-and-more/

10-25 True Challengers Costa Rica
- http://www.eventhubs.com/news/2015/oct/25/central-america-capcom-pro-tour-qualifier-stream-feat-pr-balrog-itabashi-zangief-and-801-strider/ 

10-30 Canada Cup
- http://www.eventhubs.com/news/2015/oct/30/canada-cup-2015-live-stream-ft-momochi-gamerbee-xian-kazunoko-bonchan-fuudo-snake-eyez-tokido-mago-dieminion-pr-balrog-ppmd-smug-and-more/

11-13 CPTA Last Chance Qualifier
- http://gamestartasia.challonge.com/

11-15 CPTA Finals
- http://gamestartasia.challonge.com/

11-28 Dremhack Winter
- https://widget.toornament.com/tournaments/56598528150ba094318b4567/information?_locale=en_GB

### Missing:
- Nine States pool 8 - http://toughcookietv.challonge.com/nst2015pool8fix
- Final Round incomplete
- Combo Breaker Pool I1-4?
- Stunfest pools
- FFM-Rumble incomplete
- SEAM only top 32
- EVO incomplete
- Summer Jam only top 32
- Manila Cup only top 16
- TFC B Pools - http://thefallclassic.challonge.com/?page=4
- TGS incomplete
- Call of Ragnarok pools
- CPT Brazil incomplete
- Defend the North incomplete (http://defendthenorth.challonge.com/dtn2015usf4top32 is less complete)
- Canada Cup incompleted (http://challonge.com/users/canadacup is less complete)
