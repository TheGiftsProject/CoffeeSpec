require 'active_support/concern'
require 'is_a_number'

module DrinkTypes
  extend ActiveSupport::Concern

  DRINK_TYPES = {
      :coffee => [:milk, :sugar, :strength],
      :tea => [:milk, :sugar, :tea_variation],
      :juice => [:juice_variation],
      :water => []
  }

  DRINK_ASPECTS = {
      :strength => [:normal, :light, :strong],
      :milk => {
          :amount => [:none, :touch, :little, :third, :half],
          :type => [:regular, :low_fat, :soy]
      },
      :sugar => {
          :amount => [0.0, 0.5, 1.0, 1.5, 2.0, 3.0],
          :type => [:white, :brown, :artificial]
      },
      :tea_variation => [:earl_grey],
      :juice_variation => [:orange, :lemon, :grapefruit]
  }

  FLAT_DRINK_ASPECTS = DRINK_ASPECTS.keys.map do |key|
    if DRINK_ASPECTS[key].is_a? Hash
      DRINK_ASPECTS[key].map do |sub_value,_|
        [key,sub_value].join("_").to_sym
      end
    else
      key
    end
  end.flatten

  module ClassMethods
    def store_attr_accessibles(keys)
      keys.each do |key|
        attr_accessible key
      end
    end

    def make_string_inquirers(keys)
      keys.each do |key|
        other_method_name = :"_#{key}"
        alias_method other_method_name, key
        define_method(key) do
          val = send(other_method_name)
          return Float(val) if val.is_a_number?
          return ActiveSupport::StringInquirer.new(val) if val.is_a?(String)
          val
        end
      end
    end

  end
end