CoffeeSpec.drinksController = Ember.ArrayController.create(
  content: []

  load: (json)->
    return if json == undefined
    @pushObject(CoffeeSpec.Drink.create(json))

  loadAll: (json)->
    for i in [0..json.length]
      @load(json[i])

)