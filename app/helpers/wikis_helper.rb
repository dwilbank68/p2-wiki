module WikisHelper

  def privatize_header_text
    @wiki.private? ? 'Private' : 'Public'
  end

  def privatize_link_text
    @wiki.private? ? 'Make Public' : 'Make Private'
  end

end
