FactoryGirl.define do
  factory :product do
    association :user, factory: :user
    name "MyString"
    pricing "9.99"
    descripction "MyText"
  end
end
