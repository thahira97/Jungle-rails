class User < ActiveRecord::Base
  has_secure_password

    validate :validate_names
    validate :validate_names
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 4 }, confirmation: true
    validates :password_confirmation, presence: true
    
    def validate_names 
      if !first_name && !last_name
        errors.add(:first_name, "Names can't be blank")
        errors.add(:last_name, "Names can't be blank")
      end
    end

    def self.authenticate_with_credentials(email, password)
      user = User.find_by(email: email.strip.downcase)
      if user && user.authenticate(password)
        user
      else
        nil
      end
    end
end
