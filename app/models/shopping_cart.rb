# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :string
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
    include AASM

    has_many :products, through: :in_shopping_carts
    has_many :in_shopping_carts

    #enum status: {payed: 1, default: 0}

    def total
        total = products.sum(:pricing).to_s + ".0"
        total.to_f / 100
        # total 
    end

    aasm column: "status" do
        state :created, initial: true
        state :payed
        state :failed

        event :pay do
            after do
                # shopping_cart.pay!
            end
            transitions from: :created, to: :payed
        end
    end
end
