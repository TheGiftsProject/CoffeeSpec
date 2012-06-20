# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready( =>
  if swfobject.hasFlashPlayerVersion("9")
    $(".share").zclip(
        path: "/ZeroClipboard.swf"
        copy: -> $(@).attr("href")
        afterCopy: ->
          $(@).tooltip("show")
          setTimeout(
            => $(@).tooltip("hide")
            800
          )
    ).tooltip(
      title: "Copied to clipboard"
      trigger: "manual"
    )
)