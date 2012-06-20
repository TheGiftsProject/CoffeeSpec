CoffeeSpec.drinksController = Ember.ArrayController.create(
  content: []

  load: (json)->
    return if json == undefined
    json['mosheValueBinding'] = "Ember.Binding.and(false, false)"
    @pushObject(CoffeeSpec.Drink.create(json))

  loadAll: (json)->
    for i in [0..json.length]
      @load(json[i])

)