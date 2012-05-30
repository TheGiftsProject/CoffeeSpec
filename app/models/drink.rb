class Drink < ActiveRecord::Base

  belongs_to :company

  DRINK_TYPES = {
      :coffee => [:milk, :sugar, :strength],
      :tea => [:milk, :sugar, :tea_variation]
  }

  DRINK_ASPECTS = {
      :milk => {
          :amount => [:none, :touch, :little, :third, :half],
          :type => [:regular, :low_fat, :soy]
      },
      :sugar => {
          :amount => [0, 0.5, 1, 1.5, 2, 3],
          :type => [:white, :brown, :artificial]
      },
      :strength => [:normal, :light, :strong],
      :tea_variation => [:earl_grey]
  }

  FLAT_DRINK_ASPECTS = DRINK_ASPECTS.keys.map do |key|
    if DRINK_ASPECTS[key].is_a? Hash
      DRINK_ASPECTS[key].map do |sub_value,_|
        :"#{key}_#{sub_value}"
      end
    else
      key
    end
  end.flatten


  attr_accessible :name, :company
  attr_accessible :drink_type, :drink_aspect_values

  validates_presence_of :name, :drink_type

  store :drink_aspect_values, :accessors => FLAT_DRINK_ASPECTS
  FLAT_DRINK_ASPECTS.each do |key|
    attr_accessible key
    define_method(key) do
      val = send(:drink_aspect_values)[key]
      return ActiveSupport::StringInquirer.new(val) if val.is_a? String
      val
    end
  end

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
    #super(:only => [:name], :methods => ALL_LINKS )
    super
  end

end
