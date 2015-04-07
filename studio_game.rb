require_relative 'game'
require_relative 'player'
require_relative 'game_turn'
require_relative 'die'
require_relative 'clumsy_player'
require_relative 'beserk_player'


player1 = Player.new("moe")
player2 = Player.new("curly", 60)
player3 = Player.new("larry", 125)
player4 = Player.new("shemp", 90)
player5 = ClumsyPlayer.new("klutz", 105)
player6 = BerserkPlayer.new("dude", 90)

knuckleheads = Game.new("knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.add_player(player5)
knuckleheads.add_player(player6)

chipmunks = Game.new("chipmunks")
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

