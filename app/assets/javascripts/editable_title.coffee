class EditableTitle
  constructor: (@el) ->
    @ui =
      title: @el.find(".title")
      form: @el.find("form")
      input: @el.find("#company_name")
    @bind()

  bind: ->
    @ui.title.click( => @hide())
    @ui.form.submit( => @submit(); false)
    @ui.form.bind("reset", => @show())

  hide: ->
    @ui.title.hide()
    @ui.form.removeClass("hidden")
    @ui.form.find("#company_name").focus()

  show: ->
    @ui.form.addClass("hidden")
    @ui.title.show()


  submit: ->
    url = @ui.form.attr("action")
    jQuery.post(url, @ui.form.serializeArray()).done( (result) =>
      @setTitle(result)
      @show()
    )

  setTitle: (text) ->
    @ui.title.text(text)
    @ui.input.val(text)

$(document).ready ->
  new EditableTitle($('.page-header'))