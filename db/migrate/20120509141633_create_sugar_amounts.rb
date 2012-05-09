class CreateSugarAmounts < ActiveRecord::Migration
  def change
    create_table :sugar_amounts do |t|
      t.float :value

      t.timestamps
    end
  end
end
