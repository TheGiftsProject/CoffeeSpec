class CreateMilkTypes < ActiveRecord::Migration
  def change
    create_table :milk_types do |t|
      t.string :value

      t.timestamps
    end
  end
end
