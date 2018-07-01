class Question < ApplicationRecord
	serialize :choices, Array
	
	validates :survey_id, presence: true
	validates :text, presence: true
	validates :choices, presence: true

	belongs_to :survey
	has_one :user, through: :survey

	COLORS = [["#00B1B3", "#A4D8D9"], ["#FF4F00", "#FFA573"], ["#FFCF01", "#FFEAAB"]]
end
