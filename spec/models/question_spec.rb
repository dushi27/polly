require 'rails_helper'

describe Question do

  before(:each) { @valid_question = Question.new(user_id: 1, text: "foo", choices: [1,2]) }

  subject { @valid_question }

	describe 'create a valid record' do 

	  it { should respond_to(:user_id) }
	  it { should respond_to(:text) }
	  it { should respond_to(:choices)}

	  it 'should raise error when user_id is not present' do 
	  	@question = Question.new(user_id: nil, text: "foo", choices: [1,2])
	  	expect(@question.valid?).to match false

	  	@question = Question.new(text: "foo", choices: [1,2])
	  	expect(@question.valid?).to match false
	  end

	  it 'should raise error when choices is not present' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: nil)
	  	expect(@question.valid?).to match false

		@question = Question.new(user_id: 1, text: "foo")
	  	expect(@question.valid?).to match false
	  end

	  it 'should output choices as a hash attr' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: nil)
	  	expect(@question.choices.is_a? Array).to match true
	  end

	  it 'should raise error when text is not present' do 
	  	@question = Question.new(user_id: 1, text: nil, choices: [1,2])
	  	expect(@question.valid?).to match false

	  	@question = Question.new(user_id: 1, choices: [1,2])
	  	expect(@question.valid?).to match false
	  end
	end

	describe 'associations' do 
		it {should respond_to(:user)}
	end
end
