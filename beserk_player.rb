require_relative 'player'

class BerserkPlayer < Player

	def initialize (name, health=100)
		super(name, health)
		@w00t_count = 0
	end

	def berserk?
		@w00t_count >5
	end

	def w00t
		super
		@woot_count +=1
		puts "#{@name} is berserk!" if berserk?
	end

	if __FILE__ == $0
		berserker = BerserkPlayer.new("berserker", 50)
		6.times { berserker.w00t }
	end

end
