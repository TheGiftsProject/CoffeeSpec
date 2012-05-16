class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :admin_id
      t.string :view_token
      t.string :edit_token

      t.timestamps
    end
    rename_column :drinks, :user_id, :company_id
  end
end
