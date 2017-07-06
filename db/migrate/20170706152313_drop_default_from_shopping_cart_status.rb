class DropDefaultFromShoppingCartStatus < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:shopping_carts, :status, nil)
  end
end
