class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true

  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false}
  
  validates :password, length: { minimum: 10, allow_blank: true}

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    user && user.authenticate(password)
  end
  
end
