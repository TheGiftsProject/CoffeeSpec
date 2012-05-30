# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready( =>
  $(".share").zclip(
      path: "/ZeroClipboard.swf"
      copy: -> $(@).attr("href")
      afterCopy: ->
        console.log("A",@)
        $(@).tooltip("show")
        setTimeout(
          => $(@).tooltip("hide")
          800
        )
  ).tooltip(
    title: "Copied to clipboard"
    trigger: "manual"
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