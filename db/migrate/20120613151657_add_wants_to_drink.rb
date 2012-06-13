class AddWantsToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :wants, :boolean, :default => false
  end
end
