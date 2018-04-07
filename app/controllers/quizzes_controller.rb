class QuizzesController < ApplicationController
	def select_level
		@levels = Difficulty.all
	end
end
