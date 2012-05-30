require 'active_support/concern'
require 'is_a_number'

module DrinkTypes
  extend ActiveSupport::Concern

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
          :amount => [0.0, 0.5, 1.0, 1.5, 2.0, 3.0],
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

  module ClassMethods
    def store_attr_accessibles(keys)
      keys.each do |key|
        attr_accessible key
      end
    end

    def make_string_inquirers(keys)
      keys.each do |key|
        alias_method :"_#{key}", key
        define_method(key) do
          val = send(:"_#{key}")
          return Float(val) if val.is_a_number?
          return ActiveSupport::StringInquirer.new(val) if val.is_a?(String)
          val
        end
      end
    end

  end
end