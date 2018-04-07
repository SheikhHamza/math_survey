class Quiz < ApplicationRecord
	belongs_to :difficulty
	has_many :questions
end
