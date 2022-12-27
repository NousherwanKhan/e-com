class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.timestamps
    end
    add_reference :products, :category, null: false, foreign_key: {on_delete: :cascade}
    add_index :products, :name, unique: true
    
  end
end
