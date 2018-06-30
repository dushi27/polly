require 'rails_helper'

describe Question do

  before(:each) { @valid_question = Question.new(survey_id: 1, text: "foo", choices: {:foo => "bar"}) }

  subject { @valid_question }

	describe 'create a valid record' do 

	  it { should respond_to(:survey_id) }
	  it { should respond_to(:text) }
	  it { should respond_to(:choices)}

	  it 'should raise error when survey_id is not present' do 
	  	@question = Question.new(survey_id: nil, text: "foo", choices: {:foo => "bar"})
	  	expect(@question.valid?).to match false

	  	@question = Question.new(text: "foo", choices: {:foo => "bar"})
	  	expect(@question.valid?).to match false
	  end

	  it 'should raise error when choices is not present' do 
	  	@question = Question.new(survey_id: 1, text: "foo", choices: nil)
	  	expect(@question.valid?).to match false

		@question = Question.new(survey_id: 1, text: "foo")
	  	expect(@question.valid?).to match false
	  end

	  it 'should output choices as a hash attr' do 
	  	@question = Question.new(survey_id: 1, text: "foo", choices: nil)
	  	expect(@question.choices.is_a? Hash).to match true
	  end

	  it 'should raise error when text is not present' do 
	  	@question = Question.new(survey_id: 1, text: nil, choices: {:foo => "bar"})
	  	expect(@question.valid?).to match false

	  	@question = Question.new(survey_id: 1, choices: {:foo => "bar"})
	  	expect(@question.valid?).to match false
	  end
	end

	describe 'associations' do 
		it {should respond_to(:survey)}
		it {should respond_to(:user)}
	end
end
