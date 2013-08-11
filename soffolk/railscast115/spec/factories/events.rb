# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    user_id 1
    action "MyString"
    eventable_id 1
    eventable_type "MyString"
  end
end
