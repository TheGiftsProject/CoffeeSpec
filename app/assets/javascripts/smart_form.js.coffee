class SmartDrinkForm
  constructor: (@el) ->
    @ui =
      anyInput: @el.find("input")
      drinkTypeRadios: @el.find("input[name='drink[drink_type]']")
      allAspects: @el.find(".control-group[data-drink_types]")
      milkAmount: @el.find("label[for='drink_milk_amount']").parent().find("input")
      milkType: @el.find("label[for='drink_milk_type']").parent()
      sugarAmount: @el.find("label[for='drink_sugar_amount']").parent().find("input")
      sugarType: @el.find("label[for='drink_sugar_type']").parent()
      preview: @el.find(".drink_preview .drink")


    @aspects = @_loadDrinkTypeAspects()

    @blankPreview = @ui.preview.html()

    @bind()
    @refresh()

  bind: ->
    @ui.anyInput.change(=> @refresh())

  refresh: ->
    @_refreshAssets()
    @_refreshMilk()
    @_refreshSugar()
    @_refreshPreview()

  _refreshPreview: ->
    @ui.preview.html(@blankPreview).removeClass().addClass("drink")
    @ui.preview.addClass(@currentDrinkType())
    currentAspects = @aspects[@currentDrinkType()]
    @ui.preview.find(".milk").addClass(currentAspects.find("input[name^='drink[milk']:checked").map(-> $(@).val()).toArray().join(" "))
    @ui.preview.find(".sugar").addClass(currentAspects.find("input[name^='drink[sugar']:checked").map(-> $(@).val()).toArray().join(" "))
    unless currentAspects.find("input[name^='drink[sugar_amount]']:checked").length == 0
      @ui.preview.find(".sugar").addClass("s" + currentAspects.find("input[name^='drink[sugar_amount]']:checked").val().toString().replace(".",""))
    @ui.preview.find(".essence").addClass(currentAspects.find("input:checked").map(-> $(@).val()).toArray().join(" "))


  _refreshAssets: ->
    @ui.allAspects.hide()
    @aspects[@currentDrinkType()].show()

  _refreshMilk: ->
    if @ui.milkAmount.val() == @ui.milkAmount.filter(":checked").val()
      @ui.milkType.hide()

  _refreshSugar: ->
    if @ui.sugarAmount.val() == @ui.sugarAmount.filter(":checked").val()
      @ui.sugarType.hide()
    
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