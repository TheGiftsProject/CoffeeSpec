CoffeeSpec.drinkTypeController = Ember.ArrayController.create(
  content: []

  loadAll: (types)->
    for i in [0..types.length]
      return if types[i] == undefined
      @pushObject(types[i])
)