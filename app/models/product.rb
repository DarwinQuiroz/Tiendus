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
  has_many :in_shopping_carts
  has_one :shopping_cart, through: :in_shopping_carts
  has_many :my_payments, through: :shopping_cart
  
  validates_presence_of :user, :name, :pricing
  validates :pricing, numericality: { greater_than: 0 }

  has_attached_file :avatar,styles: {thumb: "100x100",medium:"300x300"},default_url:"/images/:style/missing.jpg"
  validates_attachment_content_type :avatar,content_type: /\Aimage\/.*\Z/

  def paypal_form
    price = pricing.to_s + ".00"
    pricing_total = price.to_f / 100
    { name: name, sku: :item, price: pricing_total, currency: "USD", quantity: 1 }
  end

  def sale
    my_payments.payed
  end

  def sales_total
    my_payments.payed.count * self.pricing
  end
end
