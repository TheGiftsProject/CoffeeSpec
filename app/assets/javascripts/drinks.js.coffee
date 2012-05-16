# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready( =>
  $(".share").popover (
      placement: "bottom"
      content: $('.share-tooltip').html()
      delay: 1000
  )

  #Initializing our Ember app global.
  window.CoffeeSpec = Ember.Application.create()

  drinksController = new CoffeeSpec.drinksController()

  #$.get('/drinks', (data) =>
  #  drinksController.set('content', data)
  #)

  drinksController.set('content', [{personName: 'Moshe', drinkType: 'coffee'}])
)

CoffeeSpec.Drink = Ember.Object.extend(
  personName: ""
  drinkType: null
  strength: null
  milkAmount: null
  milkType: null
)

CoffeeSpec.drinksController = Ember.ArrayController.create(
  content: [],

  createDrink: (data) ->
    drink = CoffeeSpec.Drink.create(
      personName: data.personName
      drinkType: data.drinkType
      strength: data.strength
      milkAmount: data.milkAmount
      milkType: data.milkType
    )

)