class Drink < ActiveRecord::Base

  belongs_to :drink_type
  belongs_to :sugar_type
  belongs_to :sugar_amount
  belongs_to :milk_type
  belongs_to :milk_amount
  belongs_to :strength
  belongs_to :variation

  attr_accessible :name, :note
  attr_accessible :drink_type_id

  def description
    "a coffee"
  end

  [:drink_type, :sugar_type, :sugar_amount, :milk_type, :milk_amount, :strength, :variation].each do |attribute|
    old_attribute = :"old_#{attribute}"
    alias_method old_attribute, attribute
    define_method(attribute) do
      object = send(old_attribute)
      ActiveSupport::StringInquirer.new(object.value)
    end
  end

end
