module WikisHelper

  def privatize_header_text
    @wiki.private? ? 'PRIVATE' : 'PUBLIC'
  end

  def privatize_link_text
    @wiki.private? ? 'Make Public' : 'Make Private'
  end

end
