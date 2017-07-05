# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string
#  pricing             :decimal(10, 2)
#  description         :text
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :product do
    association :user, factory: :user
    name "MyString"
    pricing "9.99"
    descripction "MyText"
  end
end
