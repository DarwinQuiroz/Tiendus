FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "dummy_#{n}@factory.com"}
    password "1234567"
    password_confirmation "1234567"
  end
end