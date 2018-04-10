class QuizzesController < ApplicationController
	def show
		@quiz = Quiz.where(id: params[:id])
		@qualtrics_response_id = params[:qualtrics_response_id]
		@qualtrics_survey_id = params[:qualtrics_survey_id]
		if @quiz.present?
			@quiz.update(qualtrics_response_id:@qualtrics_response_id)
			@quiz.update(qualtrics_survey_id: @qualtrics_survey_id)
			@quiz.save
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
