FactoryGirl.define do
  factory :user do
    email 'dhh@preunion.com'
    nickname 'dhh'
    provider 'github'
    uid 1
    github_homepage 'https://github.com/dhh'
  end
end
