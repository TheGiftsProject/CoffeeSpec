class AddTokenToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :token, :string
  end
end
