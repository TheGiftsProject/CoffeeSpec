module NewFormHelper
  def drink_types_for(aspect)
    Drink::DRINK_TYPES.reject do |_, aspects|
      not aspects.include?(aspect)
    end.keys.map(&:to_s)
  end
end