require 'rails_helper'

describe Answer do

  before(:each) { @valid_answer = Answer.new(choice_identifier: 'foo', question_id: 1) }

  subject { @valid_answer }

  describe 'creates a valid record' do 
    it { should respond_to(:choice_identifier) }
    it { should respond_to(:question_id)}

    it 'should raise error when question_id is not present' do 
    	@answer = Answer.new(choice_identifier: 'foo', question_id: nil)
    	expect(@answer.valid?).to match false

    	@answer = Answer.new(choice_identifier: 'foo')
    	expect(@answer.valid?).to match false
    end
  end

  describe 'associations' do 
    it { should respond_to(:question)}
    it { should respond_to(:user)}
  end
end
