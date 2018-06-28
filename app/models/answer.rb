class Answer < ApplicationRecord
	validates :question_id, presence: true
	validates :survey_id, presence: true

	belongs_to :survey
	has_one :user, through: :survey
end
