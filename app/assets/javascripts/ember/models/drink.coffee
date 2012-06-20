CoffeeSpec.Drink = Ember.Object.extend(
  sugar_computed: (->
    return unless @drink_type == 'coffee' or @drink_type == 'tea'
    amount = @sugar_amount.toString()
    amount = "#{amount}.0" if amount.indexOf(".") is -1
    return "s#{amount.replace(".", "")}"
  ).property('sugar_amount')

  isCoffeeOrTea: (->
    @drink_type is 'coffee' or @drink_type is 'tea'
  ).property('drink_type')

  description: (->
    #strength drink_type with milk_amount of milk and sugar_amount sugar
    "#{@strength} #{@drink_type} with #{@milk_amount} of milk and #{@sugar_amount} sugar"
  ).property('milk_type', 'milk_amount', 'strength', 'drink_type', 'sugar_type', 'sugar_amount')
)
