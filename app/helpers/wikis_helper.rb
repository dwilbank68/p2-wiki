module WikisHelper

  def privatize_header_text
    @wiki.private? ? "This is a private wiki" : "This is a public wiki. Become a premium member to create private wikis!"
  end

  def privatize_link_text
    @wiki.private? ? 'Make Public' : 'Make Private'
  end

end
