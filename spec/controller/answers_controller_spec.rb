require 'rails_helper'

describe AnswersController do 
	describe '#create', :type => :controller do 
		it 'POST req succeed' do 
		    post :index
		    expect(response.success?).to match true
		end
	end
end