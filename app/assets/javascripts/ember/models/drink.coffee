CoffeeSpec.Drink = Ember.Object.extend(
  sugar_computed: (->
    amount = @sugar_amount.toString()
    amount = "#{amount}.0" if amount.indexOf(".") is -1
    return "s#{amount.replace(".", "")}"
  ).property('sugar_amount')
)
