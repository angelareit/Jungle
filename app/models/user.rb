class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6}  
  validates :password_confirmation, presence: true  
  validates :email, uniqueness: true

  def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    end
    return nil
   
  end

end
