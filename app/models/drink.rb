class Drink < ActiveRecord::Base

  belongs_to :drink_type
  belongs_to :sugar_type
  belongs_to :sugar_amount
  belongs_to :milk_type
  belongs_to :milk_amount
  belongs_to :strength
  belongs_to :variation

  attr_accessible :name, :note
  attr_accessible :drink_type_id, :sugar_amount_id, :sugar_type_id, :milk_amount_id, :milk_type_id, :strength_id

  def description
    "a coffee"
  end

  [:drink_type, :sugar_type, :sugar_amount, :milk_type, :milk_amount, :strength, :variation].each do |attribute|
    old_attribute = :"old_#{attribute}"
    alias_method old_attribute, attribute
    define_method(attribute) do
      object = send(old_attribute)
      return ActiveSupport::StringInquirer.new if object.nil?
      ActiveSupport::StringInquirer.new(object.value) if object.value.is_a?(String)
      object.value
    end
  end

end
