# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string
#  pricing             :integer
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
    pricing 1000
    descripction "MyText"
  end
end
