# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $('.wiggle-actions button').tooltip
    html: false
    delay:
      show: 500

  $('.wiggle-actions button').click ->
    action = $(this).attr('data-action')
    id     = $(this).attr('data-id')

    switch action
      when 'like'
        $.ajax("/wiggles/#{id}/like",
          type: 'POST'
          success: (data) =>
            $(this).addClass('btn-success')
            $(this).attr('data-action', 'unlike')
            $(this).attr('data-original-title', 'Unlike')

            count = parseInt $(this).children('span.like-count').html()
            $(this).children('span.like-count').html(count + 1)

            $(this).siblings().prop('disabled', true)
            $(this).siblings('.bookmark-button').prop('disabled', false)
        )
      when 'unlike'
        $.ajax("/wiggles/#{id}/like",
          type: 'DELETE'
          success: (data) =>
            $(this).removeClass('btn-success')
            $(this).attr('data-action', 'like')
            $(this).attr('data-original-title', 'Like')

            count = parseInt $(this).children('span.like-count').html()
            $(this).children('span.like-count').html(count - 1)

            $(this).siblings().prop('disabled', false)
        )
      when 'dislike'
        $.ajax("/wiggles/#{id}/dislike",
          type: 'POST'
          success: (data) =>
            $(this).addClass('btn-danger')
            $(this).attr('data-action', 'undislike')
            $(this).attr('data-original-title', 'Undislike')

            count = parseInt $(this).children('span.dislike-count').html()
            $(this).children('span.dislike-count').html(count + 1)

            $(this).siblings().prop('disabled', true)
            $(this).siblings('.bookmark-button').prop('disabled', false)
        )
      when 'undislike'
        $.ajax("/wiggles/#{id}/dislike",
          type: 'DELETE'
          success: (data) =>
            $(this).removeClass('btn-danger')
            $(this).attr('data-action', 'dislike')
            $(this).attr('data-original-title', 'Dislike')

            count = parseInt $(this).children('span.dislike-count').html()
            $(this).children('span.dislike-count').html(count - 1)

            $(this).siblings().prop('disabled', false)
        )
      when 'bookmark'
        $.ajax("/wiggles/#{id}/bookmark",
          type: 'POST'
          success: (data) =>
            $(this).addClass('btn-primary')
            $(this).attr('data-action', 'unbookmark')
            $(this).attr('data-original-title', 'Remove from bookmark')

            $(this).siblings('.hide-button').prop('disabled', true)
        )
      when 'unbookmark'
        $.ajax("/wiggles/#{id}/bookmark",
          type: 'DELETE'
          success: (data) =>
            $(this).removeClass('btn-primary')
            $(this).attr('data-action', 'bookmark')
            $(this).attr('data-original-title', 'Put in bookmark')

            $(this).siblings().prop('disabled', false)
        )
      when 'hide'
        $.ajax("/wiggles/#{id}/hide",
          type: 'POST'
          success: (data) =>
            $(this).addClass('btn-warning')
            $(this).attr('data-action', 'unhide')
            $(this).attr('data-original-title', 'Unhide')

            $(this).siblings().prop('disabled', true)
        )
      when 'unhide'
        $.ajax("/wiggles/#{id}/hide",
          type: 'DELETE'
          success: (data) =>
            $(this).removeClass('btn-warning')
            $(this).attr('data-action', 'hide')
            $(this).attr('data-original-title', 'Hide')

            $(this).siblings().prop('disabled', false)
        )
