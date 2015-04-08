require_relative '../../game'
require 'rspec'

module ErinGame
include RSpec

	describe Game do
		
		before do
			@game = Game.new("knuckleheads")

			@initial_health = 100
			@player = Player.new("moe", @initial_health)

			@game.add_player(@player)
		end

		it "high number rolled" do
			allow_any_instance_of(Die).to receive(:roll).and_return(6)
			@game.play(2)
			expect(@player.health).to eq(@initial_health + (15*2))
		end

		it "medium number rolled" do
			allow_any_instance_of(Die).to receive(:roll).and_return(3)
			@game.play(2)
			expect(@player.health).to eq(@initial_health)
		end

		it "low number rolled" do
			allow_any_instance_of(Die).to receive(:roll).and_return(1)
			@game.play(2)
			expect(@player.health).to eq(@initial_health - (10*2))
		end

		it "assigns a treasure for points during a player's turn" do     
			  game = Game.new("Knuckleheads")
			  player = Player.new("moe")
			     
			  game.add_player(player)
			  
			  game.play(1)
			  
			  expect(player.points).not_to be_zero
			  
			  # or use alternate expectation syntax:
			  # expect(player.points).not_to be_zero
		end

		it "computes total points as the sum of all player points" do
		  game = Game.new("Knuckleheads")
		  
		  player1 = Player.new("moe")
		  player2 = Player.new("larry")
		  
		  game.add_player(player1)
		  game.add_player(player2)
		  
		  player1.found_treasure(Treasure.new(:hammer, 50))
		  player1.found_treasure(Treasure.new(:hammer, 50))
		  player2.found_treasure(Treasure.new(:crowbar, 400))
		  
		  game.total_points.should == 500
		end
	end
end