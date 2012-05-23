class Drink < ActiveRecord::Base

  belongs_to :company

  ALL_LINKS = [:drink_type, :sugar_type, :sugar_amount, :milk_type, :milk_amount, :strength, :variation]

  belongs_to :drink_type
  belongs_to :sugar_type
  belongs_to :sugar_amount
  belongs_to :milk_type
  belongs_to :milk_amount
  belongs_to :strength
  belongs_to :variation

  attr_accessible :name, :note, :company
  attr_accessible :drink_type_id, :sugar_amount_id, :sugar_type_id, :milk_amount_id, :milk_type_id, :strength_id

  validates_presence_of :name, :drink_type_id, :sugar_amount_id, :sugar_type_id, :milk_amount_id, :milk_type_id, :strength_id

  def description
    sentence = []
    sentence << strength if strength.present? and strength != "normal"
    sentence << drink_type

    if milk_amount.present?
      sentence << "with"
      if milk_amount != "none"
        sentence << "a" if milk_amount.touch? or milk_amount.little? or milk_amount.third?
        if milk_amount.max?
          sentence << "lots"
        else
          sentence << milk_amount.humanize
        end
        sentence << "of" if milk_amount.touch? or milk_amount.little? or milk_amount.max?
        sentence << milk_type.humanize if milk_type.present? and !milk_type.regular?
        sentence << "milk"
      else
        sentence << "no milk"
      end
    end

    if sugar_amount.present?
      if sugar_amount > 0
        sentence << "and"
        if sugar_amount % 1 > 0
          sentence << sugar_amount
        else
          sentence << sugar_amount.to_i
        end
        sentence << sugar_type if sugar_type.present? and sugar_type.brown?
        if sugar_type.artificial?
          sentence << "artificial sweetener"
        else
          sentence << "sugar"
        end
      else
        sentence << "no sugar"
      end
    end

    sentence.join(" ")
  end

  def as_json(options)
    super(:only => [:name], :methods => ALL_LINKS )
  end

  ALL_LINKS.each do |attribute|
    old_attribute = :"old_#{attribute}"
    alias_method old_attribute, attribute
    define_method(attribute) do
      object = send(old_attribute)
      return ActiveSupport::StringInquirer.new if object.nil?
      return ActiveSupport::StringInquirer.new(object.value) if object.value.is_a?(String)
      object.value
    end
  end

end
