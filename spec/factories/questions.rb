FactoryGirl.define do
  factory :question do
  	user_id 1
    text "MyString"
    choices ["MyText"]
    short_code "abcd"
  end
end
