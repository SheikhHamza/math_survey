class Difficulty < ApplicationRecord
	has_many :quizzes, optional: true
end
