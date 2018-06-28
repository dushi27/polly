require 'rails_helper'

describe Survey do

	before(:each) { @valid_survey = Survey.new(user_id: 1) }

	subject { @valid_survey }

	describe 'creates a valid record' do 
	  it { should respond_to(:user_id) }

	  it 'should raise error when user_id is not present' do 
	  	@answer = Survey.new(user_id: nil)
	  	expect(@answer.valid?).to match false

	  	@answer = Survey.new()
	  	expect(@answer.valid?).to match false
	  end
	end

	describe 'associations' do 
		it { should respond_to(:user) }
		it { should respond_to(:questions) }
		it { should respond_to(:answers) }
	end
end
