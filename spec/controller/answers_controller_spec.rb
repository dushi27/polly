require 'rails_helper'

describe AnswersController do 
	describe '#create', :type => :controller do 
		it 'POST req succeed' do 
		    post :index
		    expect(response.success?).to match true
		end
	end

	describe '#new', :type => :controller do 
		it 'GET req succeed' do 
			@question = Question.new(text: 'foo bar', short_code: 'abcd', choices: "1,2,3")
		    get '/abcd'
		    expect(response.success?).to match true
		end
	end
end