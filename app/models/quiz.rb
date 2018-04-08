class Quiz < ApplicationRecord
	belongs_to :difficulty, optional: true
	has_many :questions
end
