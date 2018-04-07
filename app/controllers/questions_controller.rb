class QuestionsController < ApplicationController
	def new
		@quiz = Quiz.find(params[:quiz_id])
		@level = Difficulty.find(@quiz.difficulty_id)
		x = @level.low
		y = @level.high
		@quiz.number_of_questions.times do 
			num1 = rand(x..y)
			num2 = rand(x..y)
			num3 = rand(x..y)
			result = num1+num2+num3
			Question.create(quiz_id:@quiz.id,number_one:num1,number_two:num2,number_three:num3,solution:result)
		end
		redirect_to quiz_questions_path(@quiz.id)
	end
	def index

	end
	def questions_params
		param.require(:question).permit(:quiz_id,:number_one,:number_two,:number_three,:solution)
	end
end
