class AddToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :nickname, :string
  end

end
