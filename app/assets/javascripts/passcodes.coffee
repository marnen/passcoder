$ ->
  $('.new_line_item').on 'click', ->
    lastLineItem = $('.line_item').last()
    lastLineItem.after lastLineItem.clone()
    false
