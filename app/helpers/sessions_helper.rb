module SessionsHelper

  def sign_in(kudoer)
    remember_token = Kudoer.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    kudoer.update_attribute(:remember_token, Kudoer.encrypt(remember_token))
    self.current_kudoer = kudoer
  end

  def sign_out
    self.current_kudoer = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_kudoer.nil?
  end

  def current_kudoer=(kudoer)
    @current_kudoer = kudoer
  end

  def current_kudoer
    remember_token = Kudoer.encrypt(cookies[:remember_token])
    @current_kudoer ||= Kudoer.find_by(remember_token: remember_token)
  end

end
