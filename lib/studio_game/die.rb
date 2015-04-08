require_relative 'player'
require_relative 'game'
require_relative 'auditable'
module ErinGame
	class Die
		include Auditable

		attr_reader :number


		def roll
			@number = rand(1..6)
			audit
			@number
		end

	end
end
