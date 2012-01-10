# bind standard to links with the class .vimeo-preview
$ ->
  $('#page_like_form').bind 'ajax:beforeSend', (evt, xhr, settings) =>
    $button = $(this).find('#page_like_button');
    $button.button('loading');

  $('#page_like_form').bind 'ajax:success', (evt, xhr, settings) =>
    $button = $(this).find '#page_like_button'
    $likes = $(this).find '#page_likes'
    amount_of_likes = (Number) $likes.text()
    console.log(amount_of_likes)
    $likes.text(++amount_of_likes)
    $button.button('complete');
    $button.attr 'disabled', 'disabled'
