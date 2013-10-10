module KudoersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(kudoer)
    gravatar_id = Digest::MD5::hexdigest(kudoer.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: kudoer.first_name + ' ' + kudoer.last_name, class: "gravatar")
  end

end
