class Question < ApplicationRecord
	serialize :choices, Hash
	
	validates :survey_id, presence: true
	validates :text, presence: true
	validates :choices, presence: true

	belongs_to :survey
end
