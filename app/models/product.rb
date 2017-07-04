class Product < ApplicationRecord
  belongs_to :user
  has_many :attachments
  
  validates_presence_of :user, :name, :pricing
  validates :pricing, numericality: { greater_than: 0 }

  has_attached_file :avatar,styles: {thumb: "100x100",medium:"300x300"},default_url:"/images/:style/missing.jpg"
  validates_attachment_content_type :avatar,content_type: /\Aimage\/.*\Z/
end
