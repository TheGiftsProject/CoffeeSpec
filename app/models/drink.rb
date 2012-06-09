class Drink < ActiveRecord::Base
  include DrinkTypes
  validates_with DrinkValidator

  belongs_to :company

  attr_accessible :name, :company
  attr_accessible :drink_type, :drink_aspect_values

  validates_presence_of :name, :drink_type

  store :drink_aspect_values, :accessors => FLAT_DRINK_ASPECTS
  store_attr_accessibles FLAT_DRINK_ASPECTS
  make_string_inquirers FLAT_DRINK_ASPECTS

  def description
    sentence = []
    sentence << strength if strength.present? and strength != "normal"
    sentence << juice_variation.humanize if juice_variation.present? and drink_type == 'juice'
    sentence << tea_variation.humanize if tea_variation.present? and drink_type == 'tea'
    sentence << soft_drink_variation.humanize if soft_drink_variation.present? and drink_type == "soft_drink"
    sentence << drink_type unless drink_type == "soft_drink"

    drink_aspects = DRINK_TYPES[drink_type.to_sym]

    if drink_aspects.include? :milk
      if milk_amount.present?
        sentence << "with"
        if milk_amount != "none"
          sentence << "a" if milk_amount.touch? or milk_amount.little? or milk_amount.third?
          sentence << milk_amount.humanize
          sentence << "of" if milk_amount.touch? or milk_amount.little?
          sentence << milk_type.humanize if milk_type.present? and !milk_type.regular?
          sentence << "milk"
        else
          sentence << "no milk"
        end
      end
    end

    if drink_aspects.include? :sugar
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
    end

    sentence.join(" ")
  end

  def as_json(options)
    super(:only => [:name, :drink_type], :methods => FLAT_DRINK_ASPECTS )
  end

  def token
    Digest::MD5.hexdigest(self[:id].to_s)
  end

end
