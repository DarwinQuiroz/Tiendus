# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :integer          default("default")
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
    has_many :products, through: :in_shopping_carts
    has_many :in_shopping_carts

    enum status: {payed: 1, default: 0}

    def total
        total = products.sum(:pricing).to_s + ".0"
        total.to_f / 100
        # total 
    end
end
