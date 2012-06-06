class SmartDrinkForm
  constructor: (@el) ->
    that = @
    @ui =
      drinkTypeRadios: @el.find("input[name='drink[drink_type]']")
      allAspects: @el.find(".control-group[data-drink_types]")

    @aspects = {}
    aspects = @aspects

    @ui.drinkTypeRadios.each ->
      drinkType = $(@).val()
      aspects[drinkType] = $(".control-group[data-drink_types*='#{drinkType}']")

    @ui.drinkTypeRadios.change ->
      that.refresh()

    @refresh()

  refresh: ->
    @ui.allAspects.hide()
    @aspects[@currentDrinkType()].show();

  currentDrinkType: ->
    @ui.drinkTypeRadios.filter(":checked").val()


$(document).ready ->
  new SmartDrinkForm($('.drink-form'))