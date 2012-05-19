CoffeeSpec.drinksController = Ember.ArrayController.create(
  content: []

  load: (json)->
    @pushObject(json)

  loadAll: (json)->
    for i in [0..json.length]
      @load(json[i])

)