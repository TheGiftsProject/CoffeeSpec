class CreateStrengths < ActiveRecord::Migration
  def change
    create_table :strengths do |t|
      t.string :value

      t.timestamps
    end
  end
end
