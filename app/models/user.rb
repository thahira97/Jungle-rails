class User < ActiveRecord::Base
  has_secure_password

    validate :validate_names
    validate :validate_names
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    
    def validate_names 
      if !first_name && !last_name
        errors.add(:first_name, "Names can't be blank")
        errors.add(:last_name, "Names can't be blank")
      end
    end
end
