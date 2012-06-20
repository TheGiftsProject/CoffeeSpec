Ember.ArrayController.reopen(
  update: (types)->
    @set('content', types)
)

CoffeeSpec.milkTypesController = Ember.ArrayController.create()
CoffeeSpec.strengthController = Ember.ArrayController.create()
CoffeeSpec.milkAmountController = Ember.ArrayController.create()
CoffeeSpec.sugarAmountController = Ember.ArrayController.create()
CoffeeSpec.sugarTypeController = Ember.ArrayController.create()
CoffeeSpec.teaVariationController = Ember.ArrayController.create()
CoffeeSpec.juiceVariationController = Ember.ArrayController.create()
CoffeeSpec.softDrinkVariationController = Ember.ArrayController.create()