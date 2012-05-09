class CreateSugarAmounts < ActiveRecord::Migration
  def change
    create_table :sugar_amounts do |t|
      t.string :value

      t.timestamps
    end
  end
end
