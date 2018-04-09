class QuizzesController < ApplicationController
	def show
		@quiz = Quiz.find(params[:id])
		@levels = Difficulty.all
	end

	def home
	end
	
	def add_level	
		@quiz = Quiz.find(params[:quiz_id])
		@quiz.update_attribute(:difficulty_id, params[:id])
		redirect_to  new_quiz_question_path(@quiz.id)
	end
end
