class Question < ApplicationRecord
	serialize :choices, Array
	
	validates :text, presence: true
	validates :choices, presence: true
	validates :user_id, presence: true

	belongs_to :user

	COLORS = [["#00B1B3", "#A4D8D9"], ["#FF4F00", "#FFA573"], ["#FFCF01", "#FFEAAB"]]
end
