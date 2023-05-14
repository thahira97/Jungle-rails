class User < ActiveRecord::Base
  has_secure_password
  
    validates :first_name, presence: { message: "Name can't be blank" }
    validates :last_name, presence: { message: "Name can't be blank" }
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
  
end
