require 'rails_helper'

describe Question do

  before(:each) { @valid_question = Question.new(user_id: 1, text: "foo", choices: "1,2"); @user = User.new(email: 'user@example.com', id: 1)  }

  subject { @valid_question }

	describe 'create a valid record' do 

	  it { should respond_to(:user_id) }
	  it { should respond_to(:text) }
	  it { should respond_to(:choices)}
	  it { should respond_to(:short_code)}

	  it 'should create a short code' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: "1,2")
	  	@question.save!
	  	expect(@question.short_code.size).to match 4
	  end

	  it 'should raise error when user_id is not present' do 
	  	@question = Question.new(user_id: nil, text: "foo", choices: "1,2")
	  	expect(@question.valid?).to match false

	  	@question = Question.new(text: "foo", choices: "1,2")
	  	expect(@question.valid?).to match false
	  end

	  it 'should raise error when choices is not present' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: nil)
	  	expect(@question.valid?).to match false

		@question = Question.new(user_id: 1, text: "foo")
	  	expect(@question.valid?).to match false
	  end

	  it 'should output choices as a string attr' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: "")
	  	expect(@question.choices.is_a? String).to match true
	  end

	  it 'should raise error when text is not present' do 
	  	@question = Question.new(user_id: 1, text: nil, choices: "1,2")
	  	expect(@question.valid?).to match false

	  	@question = Question.new(user_id: 1, choices: "1,2")
	  	expect(@question.valid?).to match false
	  end

	  it 'should sort str choices before saving' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: "IOS, Apple")
	  	@question.save!
	  	expect(@question.choices).to match "Apple,IOS"
	  end

	  it 'should sort int choices before saving' do 
	  	@question = Question.new(user_id: 1, text: "foo", choices: "2,1")
	  	@question.save!
	  	expect(@question.choices).to match "1,2"
	  end
	end

	describe 'associations' do 
		it {should respond_to(:user)}
	end

	describe '#choices_array' do 
		it 'should output empty array if choices are ""' do 
			@question = Question.new(user_id: 1, choices: "")
			expect(@question.choices_array).to match []
		end

		it 'should output array if question has choice' do 
			@question = Question.new(user_id: 1, choices: "1,2")
			expect(@question.choices_array).to match ["1","2"]
		end

		it 'should output array if no commas are found' do 
			@valid_question.choices = "1"
			@valid_question.save
			expect(@valid_question.choices_array).to match ["1"]
		end
	end
end
