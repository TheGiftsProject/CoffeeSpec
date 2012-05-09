class CreateMilkAmounts < ActiveRecord::Migration
  def change
    create_table :milk_amounts do |t|
      t.string :value

      t.timestamps
    end
  end
end
