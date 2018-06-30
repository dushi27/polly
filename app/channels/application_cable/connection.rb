module ApplicationCable
	class Connection < ActionCable::Connection::Base
	identified_by :survey_owner

	def connect
	  self.survey_owner = find_verified_user
	end

	private

		def find_verified_user
			if current_user
			  current_user
			else
			  reject_unauthorized_connection
			end
		end
	end
end
