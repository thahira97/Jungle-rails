require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      # Create an existing user with a lowercase email
      User.create(
        first_name: 'Existing',
        last_name: 'User',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    it 'should save successfully when all fields are set' do
      user = User.new(
        first_name: 'Thahira',
        last_name: 'Sheerin',
        email: 'lhl.student.com',
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
    it 'should have unique email' do
      user = User.new(
        first_name: 'Thahira',
        last_name: 'Sheerin',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.save)
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    it "should not save when not provided first name " do
      user = User.new(
        last_name: 'Sheerin',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'pass'
      )
      expect(user.save).to be false
    end
    it "should not save when not provided last name " do
      user = User.new(
        first_name: 'Thahira',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'pass'
      )
      expect(user.save).to be false
    end
    it "should not save when not provided Email " do
      user = User.new(
        first_name: 'Thahira',
        last_name: 'Sheerin',
        password: 'password',
        password_confirmation: 'pass'
      )
      expect(user.save).to be false
    end
    it "password should have a minimum length of 4" do
      user = User.new(
        first_name: 'Thahira',
        last_name: 'Sheerin',
        email: "lhl.14cohort@lhl.com",
        password: 'pa',
        password_confirmation: 'pa'
      )
      expect(user.save).to be false
    end
  end
  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'john@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    it 'should return the user instance if email and password are valid' do
      user = User.authenticate_with_credentials('john@example.com', 'password')
      expect(user).to eq(@user)
    end
    it 'should return nil instance if email is valid' do
      user = User.authenticate_with_credentials('johle.com', 'password')
      expect(user).to eq(nil)
    end
    it 'should return nil if password is invalid' do
      user = User.authenticate_with_credentials('john@example.com', 'pass')
      expect(user).to eq(nil)
    end
    it 'should return the user instance if email has whitespaces' do
      user = User.authenticate_with_credentials('  john@example.com  ', 'password')
      expect(user).to eq(@user)
    end

    it 'should return the user instance if email has different casing' do
      user = User.authenticate_with_credentials('JoHn@ExAmPlE.CoM', 'password')
      expect(user).to eq(@user)
    end
  end

end
