$ ->
  $('.new_line_item').on 'click', ->
    lastLineItem = $('.line_item').last()
    lastLineItem.append lastLineItem.clone()
