require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require_relative 'playable'

class Game

	attr_reader :title

	def initialize(title)
		@title = title.capitalize
		@players = []
	end

	def add_player(a_player)
		@players.push(a_player)
	end

	def print_stats
		strong_players, wimpy_players = @players.partition {|player| player.strong?}
		puts "\n#{@title} Statistics:"

		puts "\n#{strong_players.size} strong players:"
		strong_players.each do |player|
			puts "#{player.name} (#{player.health})"
		end

		puts "\n#{wimpy_players.size} wimpy players:"
		wimpy_players.each do |player|
			puts "#{player.name} (#{player.health})"
		end
		
		puts "\n#{@title} High Scores:"
		@players.sort.each do |player|
			puts high_scores_entry(player)
		end

		@players.sort.each do |player|
			puts "\n#{player.name}'s point totals:"
			player.each_found_treasure do |treasure|
				puts "#{treasure.points} total #{treasure.name} points"
			end
			puts "#{player.points} grand total points"
		end
		
		puts "\nTotal Points: #{total_points} points from treasure found"
	end

	def play(rounds)

		treasures = TreasureTrove::TREASURES
		puts "There are #{treasures.size} treasures to be found:"
			treasures.each do |treasure|
				puts "A #{treasure.name} is worth #{treasure.points} points"
			end

		puts "\nThere are #{@players.size} players in #{@title}:"
		@players.each do |player|
			puts player
		end

		1.upto(rounds) do |round|
			if block_given?
				break if yield
			end
			puts "\nRound #{round}:"
			@players.each do |player|
			GameTurn.take_turn(player)
			end
		end
	end

	def total_points
		@players.reduce(0) { |sum, player| sum + player.points}
	end

	def load_players(file_name)
		File.readlines(file_name).each do |line|
			add_player(Player.from_csv(line))
		end
	end

	def high_scores_entry(player)
		 "#{player.name.ljust(40, '.')} #{player.score}"
	end

	def save_high_scores(to_file="high_scores.txt")
		File.open(to_file, "w") do |file|
			file.puts "#{@title} High Scores:"
			@players.sort.each do |player|
				file.puts high_scores_entry(player)
			end
		end
	end

end