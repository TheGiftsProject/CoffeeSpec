class Drink < ActiveRecord::Base

  belongs_to :user

  belongs_to :drink_type
  belongs_to :sugar_type
  belongs_to :sugar_amount
  belongs_to :milk_type
  belongs_to :milk_amount
  belongs_to :strength
  belongs_to :variation

  attr_accessible :name, :note, :user
  attr_accessible :drink_type_id, :sugar_amount_id, :sugar_type_id, :milk_amount_id, :milk_type_id, :strength_id

  validates_presence_of :name, :drink_type_id, :sugar_amount_id, :sugar_type_id, :milk_amount_id, :milk_type_id, :strength_id
  validates_presence_of :user

  def description
    sentence = []
    sentence << strength if strength.present?
    sentence << drink_type

    if milk_amount.present?
      if milk_amount != "none"
        sentence << "with"
        sentence << "a"
        sentence << milk_amount
        sentence << milk_type if milk_type.present?
        sentence << "milk"
      else
        sentence << "no milk"
      end
    end

    if sugar_amount.present?
      if sugar_amount > 0
        sentence << "with"
        if sugar_amount % 1 > 0
          sentence << sugar_amount
        else
          sentence << sugar_amount.to_i
        end
        sentence << sugar_type if sugar_type.present?
        sentence << "sugar"
      else
        sentence << "no sugar"
      end
    end

    sentence.join(" ")
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
