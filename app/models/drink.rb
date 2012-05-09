class Drink < ActiveRecord::Base

  belongs_to :drink_type
  belongs_to :sugar_type
  belongs_to :sugar_amount
  belongs_to :milk_type
  belongs_to :milk_amount
  belongs_to :strength
  belongs_to :variation

  attr_accessible :name, :note
end
