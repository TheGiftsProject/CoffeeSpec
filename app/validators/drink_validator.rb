class DrinkValidator < ActiveModel::Validator
  def validate(record)
    drink_type = record.drink_type.to_sym
    record.errors[:drink_type] = "Invalid drink type" and return false unless Drink::DRINK_TYPES.include? drink_type

    needed_aspects = Drink::DRINK_TYPES[drink_type]
    needed_aspects.each do |aspect|
      aspect_values = Drink::DRINK_ASPECTS[aspect]
      if aspect_values.is_a?(Array)
        validate_aspect(record, aspect, aspect_values)
      else
        aspect_values.each do |k,v|
          validate_aspect(record, [aspect, k].join("_"), v)
        end
      end
    end

    return true
  end

  def validate_aspect(record, aspect, values)
    value = record.send(aspect.to_sym)
    record.errors[aspect.to_sym] << "Missing aspect" and return false if value.blank?
    record.errors[aspect.to_sym] << "Invalid aspect" and return false unless values.include? value.to_sym
    return true
  end


end