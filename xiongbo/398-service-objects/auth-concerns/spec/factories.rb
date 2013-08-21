FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar"
    email { "#{username}@example.com" }
  end
end
