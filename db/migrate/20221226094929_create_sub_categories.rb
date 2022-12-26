class CreateSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.timestamps
    end
    add_reference :sub_categories, :category, foreign_key: true
    add_index :sub_categories, :name, unique: true
  end
end
