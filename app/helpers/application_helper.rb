module ApplicationHelper

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def days_remaining
    distance_of_time_in_words(DateTime.now, current_user.account_expiration)
  end

  def user_status
    current_user.subscribed ? "(Premium User)" : "(Free User)"
  end

end
