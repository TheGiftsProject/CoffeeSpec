class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.references :drink_type
      t.references :sugar_type
      t.references :sugar_amount
      t.references :milk_type
      t.references :milk_amount
      t.references :strength
      t.references :variation
      t.string :note

      t.timestamps
    end
    add_index :drinks, :drink_type_id
    add_index :drinks, :sugar_type_id
    add_index :drinks, :sugar_amount_id
    add_index :drinks, :milk_type_id
    add_index :drinks, :milk_amount_id
    add_index :drinks, :strength_id
    add_index :drinks, :variation_id
  end
end
