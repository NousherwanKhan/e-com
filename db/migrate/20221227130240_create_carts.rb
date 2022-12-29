class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|

      t.bigint :category_id
      t.bigint :product_id
      t.bigint :user_id
      t.timestamps
      
    end
    
  end
end
