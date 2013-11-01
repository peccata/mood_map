FactoryGirl.define do
  factory :user do
    sequence(:nickname)  { |n| "nickname#{n}" }
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar2000"
  end

  factory :mood do
    state 1
    user
  end
end
