CoffeeSpec.Drink = Ember.Object.extend(
  sugar_computed: (->
    debugger
    amount = @sugar_amount.toString()
    amount = "#{amount}.0" if amount.indexOf(".") is -1
    return "s#{amount.replace(".", "")}"
  ).property('sugar_amount')

  description: (->
    #strength drink_type with milk_amount of milk and sugar_amount sugar
    "#{@strength} #{@drink_type} with #{@milk_amount} of milk and #{@sugar_amount} sugar"
  ).property('milk_type', 'milk_amount', 'strength', 'drink_type', 'sugar_type', 'sugar_amount')

)
