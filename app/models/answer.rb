class Answer < ApplicationRecord
	validates :question_id, presence: true
	validates :survey_id, presence: true
end
