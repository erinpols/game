require_relative 'game'
require_relative 'player'
require_relative 'game_turn'
require_relative 'die'
require_relative 'clumsy_player'
require_relative 'beserk_player'


player1 = ErinGame::Player.new("moe")
player2 = ErinGame::Player.new("curly", 60)
player3 = ErinGame::Player.new("larry", 125)
player4 = ErinGame::Player.new("shemp", 90)
player5 = ErinGame::ClumsyPlayer.new("klutz", 105, 3)
player6 = ErinGame::BerserkPlayer.new("dude", 90)

knuckleheads = ErinGame::Game.new("knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player5)
knuckleheads.add_player(player6)

chipmunks = ErinGame::Game.new("chipmunks")
chipmunks.load_players(ARGV.shift || "players.csv")

loop do
	puts "\nHow many game rounds? ('quit' to exit)"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when 'quit', 'exit'
		knuckleheads.print_stats
		break
	else
		puts "Please enter a number or 'quit'"
	end
end

knuckleheads.save_high_scores

