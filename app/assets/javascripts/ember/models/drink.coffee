CoffeeSpec.Drink = Ember.Object.extend(
  sugar_computed: (->
    return "s#{@sugar_amount.toString().replace(".", "")}"
  ).property('sugar_amount')
)
