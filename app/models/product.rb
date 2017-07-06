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

class Product < ApplicationRecord
  belongs_to :user
  has_many :attachments
  
  validates_presence_of :user, :name, :pricing
  validates :pricing, numericality: { greater_than: 0 }

  has_attached_file :avatar,styles: {thumb: "100x100",medium:"300x300"},default_url:"/images/:style/missing.jpg"
  validates_attachment_content_type :avatar,content_type: /\Aimage\/.*\Z/
end
