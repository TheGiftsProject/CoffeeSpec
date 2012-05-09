class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.string :value

      t.timestamps
    end
  end
end
