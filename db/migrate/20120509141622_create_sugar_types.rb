class CreateSugarTypes < ActiveRecord::Migration
  def change
    create_table :sugar_types do |t|
      t.string :value

      t.timestamps
    end
  end
end
