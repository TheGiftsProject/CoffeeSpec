module DrinkHelper
  def essence_classes(drink)
    drink.drink_aspect_values.except(:milk_amount, :milk_type, :sugar_amount, :sugar_type).values.join(" ")
  end
  
  def milk_classes(drink)
    "#{drink.milk_type} #{drink.milk_amount}"
  end

  def sugar_classes(drink)
    "#{drink.sugar_type} s#{drink.sugar_amount.to_s.gsub(".","")}"
  end
end