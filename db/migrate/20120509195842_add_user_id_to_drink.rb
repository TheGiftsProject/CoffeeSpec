class AddUserIdToDrink < ActiveRecord::Migration
  def change
    add_column :drinks, :user_id, :integer
  end
end
