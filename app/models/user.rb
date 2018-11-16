class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy

  def admin?
    self.role == "admin"
  end
  
end
