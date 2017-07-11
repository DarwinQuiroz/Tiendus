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
    has_many :my_payments

    #enum status: {payed: 1, default: 0}
    aasm column: "status" do
        state :created, initial: true
        state :payed
        state :failed

        event :pay do
            after do
                self.generate_link()
            end
            transitions from: :created, to: :payed
        end
    end

    def items
        self.products.map{ |product| product.paypal_form }
    end
    
    def total
        total = products.sum(:pricing).to_s + ".0"
        total.to_f / 100
        # products.sum(:pricing)
    end

    def generate_link
        self.products.each do |product|
            Link.create(expiration_date: DateTime.now + 7.days, product: product, email: payment.email)
        end
    end

    def payment
        begin
            my_payments.payed.first
        rescue Exception => e
            return nil
        end
    end
end
