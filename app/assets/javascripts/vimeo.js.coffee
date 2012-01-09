# Assign to $ to jquery to resolve eventual naming conflicts
$ = jQuery

# Reserve a namespace
$.fn.extend
  vimeo_preview: (options) ->

    # Default settings
    settings =
      iframe: '#video-details-modal iframe'
      modal: '#video-details-modal'

    # Merge default settings with options.
    settings = $.extend settings, options

    # Bind the click event
    # @param element the link
    bind_event = ($element) ->
      $element.bind 'click', (event) =>
        show_preview $element
        true

    # show a modal with a vimeo video
    # @param element
    show_preview = ($element) ->
      video_id = $element.attr("video-id")
      thumbnail = $element.find("img").attr("src")
      $(settings.modal).find("#page_video_video_id").val(video_id)
      $(settings.modal).find("#page_video_photo_url").val(thumbnail)
      $(settings.iframe).attr("src", "http://player.vimeo.com/video/#{video_id}?api=1&amp;player_id=vimeo-preview")

    # bind the popup event
    return @each (index, element)->
      bind_event $(element)

# bind standard to links with the class .vimeo-preview
$ ->
  $('.vimeo-preview').vimeo_preview()
