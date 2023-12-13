class User < ApplicationRecord
  has_many :tasks

  def password=(val)
  if val.present?
    self.password_digest = BCrypt::Password.create(val)
  end
  @password = val
  end
  
  def activated?
    self.activated
  end
  
end