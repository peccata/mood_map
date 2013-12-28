FactoryGirl.define do
  factory :user do
    sequence(:nickname)  { |n| "nickname#{n}" }
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar2000"
  end

  factory :mood do
    state 1
    latitude 50
    longitude 50
    user
  end
end
