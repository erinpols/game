require_relative 'game'
require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module GameTurn

	def self.take_turn(player)
			die = Die.new
			number_rolled = die.roll
			if number_rolled < 3
				puts player.blam
			elsif number_rolled < 5
				puts "#{player.name} was skipped"
			else
				puts player.w00t
			end
			
			treasure = TreasureTrove.random
			player.found_treasure(treasure)

	end






end
