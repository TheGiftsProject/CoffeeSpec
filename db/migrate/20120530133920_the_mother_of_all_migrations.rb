class TheMotherOfAllMigrations < ActiveRecord::Migration
  def up
    drop_table :drink_types
    drop_table :milk_amounts
    drop_table :milk_types
    drop_table :strengths
    drop_table :sugar_amounts
    drop_table :sugar_types
    drop_table :variations

    remove_columns :drinks, :sugar_amount_id, :sugar_type_id, :milk_amount_id, :milk_type_id, :drink_type_id, :strength_id, :variation_id, :note

    add_column :drinks, :drink_type, :string
    add_column :drinks, :drink_aspect_values, :text
  end

  def down
  end
end
