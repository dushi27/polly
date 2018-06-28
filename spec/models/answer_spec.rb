require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "#validations" do 
  	 expect(Answer.new).to allow_value('foo').for(:choice_identifier)
     expect(Answer.new).to_not allow_value('EZ').for(:state)
  end
end
