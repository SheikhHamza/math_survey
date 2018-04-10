class QuizzesController < ApplicationController
	def show
		@quiz = Quiz.where(id: params[:id])
		if @quiz.present?
			@quiz = @quiz[0]
			@levels = Difficulty.all
			if @quiz.score.present?
				redirect_to quizzes_Completed_path
			end
		else
			redirect_to '/'
		end
	end

	def home
	end


	def end_response

	end


	def already_taken
	end
	
	def add_level	
		@quiz = Quiz.find(params[:quiz_id])
		@quiz.update_attribute(:difficulty_id, params[:id])
		redirect_to  new_quiz_question_path(@quiz.id)
	end
end
