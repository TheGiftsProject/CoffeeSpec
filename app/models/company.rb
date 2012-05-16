class Company < ActiveRecord::Base
  attr_accessible :admin_id, :edit_token, :name, :view_token
end
