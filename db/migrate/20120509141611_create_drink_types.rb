class CreateDrinkTypes < ActiveRecord::Migration
  def change
    create_table :drink_types do |t|
      t.string :value

      t.timestamps
    end
  end
end
