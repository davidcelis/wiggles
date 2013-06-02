module ApplicationHelper
  def action_buttons(wiggle)
    likes = current_user.likes?(wiggle)
    dislikes = current_user.dislikes?(wiggle)
    hides = current_user.hides?(wiggle)
    bookmarks = current_user.bookmarks?(wiggle)

    if likes
      klass  = 'btn like-button btn-success'
      action = 'unlike'
      disabled = false
    else
      klass  = 'btn like-button'
      action = 'like'
      disabled = dislikes || hides ? true : false
    end

    like_button = <<-BUTTON
<button class='#{klass}' data-id='#{wiggle.id}' data-action='#{action}' data-original-title='#{action.capitalize}' #{'disabled' if disabled}>
  <i class='icon-thumbs-up'></i>
  <span class='like-count pull-right'>#{wiggle.liked_by_count}</span>
</button>
    BUTTON

    if dislikes
      klass  = 'btn dislike-button btn-danger'
      action = 'undislike'
      disabled = false
    else
      klass  = 'btn dislike-button'
      action = 'dislike'
      disabled = likes || hides ? true : false
    end

    dislike_button = <<-BUTTON
<button class='#{klass}' data-id='#{wiggle.id}' data-action='#{action}' data-original-title='#{action.capitalize}' #{'disabled' if disabled}>
  <i class='icon-thumbs-down'></i>
  <span class='dislike-count pull-right'>#{wiggle.disliked_by_count}</span>
</button>
    BUTTON

    if bookmarks
      klass  = 'btn bookmark-button btn-primary'
      action = 'unbookmark'
      disabled = false
    else
      klass  = 'btn bookmark-button'
      action = 'bookmark'
      disabled = hides ? true : false
    end

    bookmark_button = <<-BUTTON
<button class='#{klass}' data-id='#{wiggle.id}' data-action='#{action}' data-original-title='#{action.capitalize}' #{'disabled' if disabled}>
  <i class='icon-bookmark'></i>
</button>
    BUTTON

    if hides
      klass  = 'btn hide-button btn-warning'
      action = 'unhide'
      disabled = false
    else
      klass  = 'btn hide-button'
      action = 'hide'
      disabled = likes || dislikes || bookmarks ? true : false
    end

    hide_button = <<-BUTTON
<button class='#{klass}' data-id='#{wiggle.id}' data-action='#{action}' data-original-title='#{action.capitalize}' #{'disabled' if disabled}>
  <i class='icon-eye-close'></i>
</button>
    BUTTON

    [like_button, dislike_button, bookmark_button, hide_button].join("\n")
  end
end
