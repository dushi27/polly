class Answer < ApplicationRecord
	validates :question_id, presence: true
	validates :survey_id, presence: true

	belongs_to :survey
	has_one :user, through: :survey
	after_create_commit :broadcast_answer

	def broadcast_answer
		ActionCable.server.broadcast "room_channel_user_#{self.user.id}", content:  self.choice_identifier, user_id: self.survey.user.id
	end
end
