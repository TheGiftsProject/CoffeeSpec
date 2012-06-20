class AddCurrentlyMakingToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :currently_making_id, :integer
  end
end
