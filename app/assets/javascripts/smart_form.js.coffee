class SmartDrinkForm
  constructor: (@el) ->
    @ui =
      drinkTypeRadios: @el.find("input[name='drink[drink_type]']")
      allAspects: @el.find(".control-group[data-drink_types]")
      milkAmount: $("label[for='drink_milk_amount']").parent().find("input")
      milkType: $("label[for='drink_milk_type']").parent()
      sugarAmount: $("label[for='drink_sugar_amount']").parent().find("input")
      sugarType: $("label[for='drink_sugar_type']").parent()

    @aspects = @_loadDrinkTypeAspects()

    @bind()
    @refresh()


  bind: ->
    @ui.drinkTypeRadios.change(=> @refresh())
    @ui.milkAmount.change(=> @refreshMilk())
    @ui.sugarAmount.change(=> @refreshSugar())

  refresh: ->
    @ui.allAspects.hide()
    @aspects[@currentDrinkType()].show();
    @refreshMilk()
    @refreshSugar()

  refreshMilk: ->
    hide = @ui.milkAmount.val() == @ui.milkAmount.filter(":checked").val()
    @ui.milkType.toggle(!hide)

  refreshSugar: ->
    hide = @ui.sugarAmount.val() == @ui.sugarAmount.filter(":checked").val()
    @ui.sugarType.toggle(!hide)
    
  currentDrinkType: ->
    @ui.drinkTypeRadios.filter(":checked").val()

  _loadDrinkTypeAspects: ->
    aspects = {}
    @ui.drinkTypeRadios.each ->
      drinkType = $(@).val()
      aspects[drinkType] = $(".control-group[data-drink_types*='#{drinkType}']")
    aspects


$(document).ready ->
  new SmartDrinkForm($('.drink-form'))