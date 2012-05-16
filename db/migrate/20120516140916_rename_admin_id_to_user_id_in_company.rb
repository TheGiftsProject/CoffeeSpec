class RenameAdminIdToUserIdInCompany < ActiveRecord::Migration
  def change
    rename_column :companies, :admin_id, :user_id
  end
end
