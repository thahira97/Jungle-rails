require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully when all fields are set' do
      user = User.new(
        first_name: 'Thahira',
        last_name: 'Sheerin',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.save).to be true
    end
    it 'should not save successfully when all password fields are wrong' do
      user = User.new(
        first_name: 'Thahira',
        last_name: 'Sheerin',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'pass'
      )
      expect(user.save).to be false
    end
    
   
  end

  # Other tests...
end
