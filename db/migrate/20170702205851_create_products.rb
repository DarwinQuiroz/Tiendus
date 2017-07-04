class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true, index:true
      t.string :name
      t.decimal :pricing, scale:2, precision:10
      t.text :description
      t.attachment :avatar
        
      t.timestamps
    end
  end
end
