class Survey < ApplicationRecord
	validates :user_id, presence: true 

	belongs_to :user
	has_many :questions
	has_many :answers
end
