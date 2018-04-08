class QuestionsController < ApplicationController
	def new
		@quiz = Quiz.find(params[:quiz_id])
		@level = Difficulty.find(@quiz.difficulty_id)
		
		delete_existing(@quiz.id)

		create_new_questions(@quiz,@level)

		@questions = @quiz.questions

		redirect_to quiz_question_path(@quiz.id,@questions[0].id)
	end
	
	def show
		@quiz = Quiz.find(params[:quiz_id])
		@question = Question.find(params[:id])
	end

	def update
		@question = Question.find(params[:id])
		@question.update_attributes(question_params)

		@quiz = Quiz.find(params[:quiz_id])
		questions = @quiz.questions 

		i = questions.find_index(@question) 
		
		if i < (@quiz.number_of_questions - 1)
			redirect_to quiz_question_path(@quiz,questions[i+1].id)
		else
			count = 0
			questions.each do |q|
				if (q.solution == q.response)
					count = count + 1
				end
			end
			@quiz.update_attributes(score: count)
			redirect_to '/'
		end

	end

	def questions_params
		param.require(:question).permit(:quiz_id,:number_one,:number_two,:number_three,:solution)
	end

	private
	
	def question_params
		params.require(:question).permit(:response)
	end
	def delete_existing(quiz_id)
		Question.where(quiz_id: quiz_id).delete_all
	end
	
	def create_new_questions(quiz,level)
		x = level.low
		y = level.high
		quiz.number_of_questions.times do 
			num1 = rand(x..y)
			num2 = rand(x..y)
			num3 = rand(x..y)
			result = num1+num2+num3
			Question.create(quiz_id:quiz.id,number_one:num1,number_two:num2,number_three:num3,solution:result)
		end
	end
end
