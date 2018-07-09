require 'securerandom' 
class Question < ApplicationRecord	
	validates :text, presence: true
	validates :choices, presence: true
	validates :user_id, presence: true

	belongs_to :user, optional: true
	before_create :set_short_code
	before_save :sort_choices

	COLORS = [["#00B1B3", "#A4D8D9"], ["#FF4F00", "#FFA573"], ["#FFCF01", "#FFEAAB"], ["#512da8", "#9575cd"], ["#2e7d32", "#81c784"]]

	def choices_array
		self.choices.split(",")
	end

	def sort_choices
		self.choices = self.choices.split(",").sort.join(",")
	end

	def set_short_code
		self.short_code ||= SecureRandom.hex(2)
	end
end
