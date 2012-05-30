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

  attr_accessible :name, :company
  attr_accessible :drink_type, :drink_aspect_values

  validates_presence_of :name, :drink_type

  def drink_aspect_values
    ActiveSupport::JSON.decode(self[:drink_aspect_values] || "{}").with_indifferent_access
  end

  def drink_aspect_values=(value)
    self[:drink_aspect_values] = value.to_json
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

  def self.return_value(val)
    return Float(val) if is_number?(val)
    return ActiveSupport::StringInquirer.new if val.nil?
    return ActiveSupport::StringInquirer.new(val) if val.is_a?(String)
    val
    end

  def self.is_number?(object)
    true if Float(object) rescue false
  end

  DRINK_ASPECTS.each do |aspect, values|
    if values.is_a?(Array)
      define_method(aspect.to_sym) do
        return Drink.return_value(drink_aspect_values[aspect])
      end
      define_method(:"#{aspect}=") do |val|
        self.drink_aspect_values = drink_aspect_values.merge({aspect => val})
      end
      attr_accessible aspect

    else
      values.each do |sub_aspect, _|
        full_aspect_name = "#{aspect}_#{sub_aspect}".to_sym
        attr_accessible full_aspect_name
        define_method(full_aspect_name) do
          v = drink_aspect_values[aspect]
          v = v[sub_aspect] unless v.nil?
          return Drink.return_value(v)
        end
        define_method(:"#{full_aspect_name}=") do |val|
          self.drink_aspect_values = drink_aspect_values.deep_merge({aspect => {sub_aspect => val}})
        end
      end
    end
  end

end
