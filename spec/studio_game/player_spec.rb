require 'studio_game/player'
require 'rspec'

module ErinGame
include RSpec

	describe Player do

		before do
			@initial_health = 150
			@player = Player.new("larry", @initial_health)
			@player2 = Player.new("moe", 100)
		end
		
		it "has a capitalized name" do
			expect(@player.name).to eq("Larry")
		end

		it "has an initial health" do
			player = Player.new("moe")
			expect(player.health).to eq(100)
		end

		it "has a string representation" do  
		  @player.found_treasure(Treasure.new(:hammer, 50))
		  @player.found_treasure(Treasure.new(:hammer, 50))

		  @player.to_s.should == "I'm Larry with health = 150, points = 100, and score = 250."
		end

		it "increases health by 15 when w00ted" do
			@player.w00t
			expect(@player.health).to eq(165)
		end

		it "decreases health by 10 when blammed" do
			@player.blam
			expect(@player.health).to eq(140)
		end

		it "defines a strong player" do
			expect(@player.strong?).to eq(true)
		end

		it "defines a strong player" do
			expect(@player2.strong?).to eq(false)
		end

		it "computes a score as the sum of its health and points" do
			 @player.found_treasure(Treasure.new(:hammer, 50))
			 @player.found_treasure(Treasure.new(:hammer, 50))
			  
			 expect(@player.score).to eq(250)
		end

		it "yields each found treasure and its total points" do
			  @player.found_treasure(Treasure.new(:skillet, 100))
			  @player.found_treasure(Treasure.new(:skillet, 100))
			  @player.found_treasure(Treasure.new(:hammer, 50))
			  @player.found_treasure(Treasure.new(:bottle, 5))
			  @player.found_treasure(Treasure.new(:bottle, 5))
			  @player.found_treasure(Treasure.new(:bottle, 5))
			  @player.found_treasure(Treasure.new(:bottle, 5))
			  @player.found_treasure(Treasure.new(:bottle, 5))

			  yielded = []
			  @player.each_found_treasure do |treasure|
			    yielded << treasure
			  end

			  yielded.should == [
			    Treasure.new(:skillet, 200),
			    Treasure.new(:hammer, 50),
			    Treasure.new(:bottle, 25)
			 ]
		end

		it "loads players from csv" do
			player = Player.from_csv("larry,150")

			expect(player.name).to eq("Larry")
			expect(player.health).to eq(150)
		end

	end

end
