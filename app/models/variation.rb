class Variation < ActiveRecord::Base

  has_many :drinks

  attr_accessible :value
end
