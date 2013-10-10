class Kudoer < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_secure_password
  validates :password, length: {minimum: 8}

  def Kudoer.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Kudoer.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = Kudoer.encrypt(Kudoer.new_remember_token)
  end

end
