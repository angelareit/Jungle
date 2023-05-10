require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    
      it 'returns false if new user is not valid. Created without name, email, and password.' do
        a_user = User.new()
        expect(a_user).to_not be_valid
      end

      it 'returns false if new user has password but no password confirmation' do
        a_user = User.new(name:"Joey Bacon Jr", password: "123456", email: "a@a.com")
        expect(a_user.valid?).to be false
      end

      it "returns false if new user's password and password_confirmation doesnt match" do
        a_user = User.new(name:"Joey Bacon Jr", password: "123456", email: "a@a.com", password_confirmation:"12356")
        expect(a_user.valid?).to be false
        expect(a_user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end

      it 'returns false if new user has invalid password length' do
        a_user = User.create(name:"Joey Bacon", password: "12345", email: "a@a.com",password_confirmation:"12345")
        expect(a_user).to_not be_valid
      end

      it 'returns false if new user has invalid email' do
        a_user = User.create(name:"Joey Bacon", password: "123456", email: "a@a.com",password_confirmation:"123456")
        b_user = User.create(name:"Joey Bacon Jr", password: "123456", email: "a@a.com", password_confirmation:"123456")
        expect(b_user).to_not be_valid
      end
    end

    describe '.authenticate_with_credentials' do
      it 'returns true if user entered the right email and password' do
        a_user = User.create(name:"Joey Bacon", password: "123456", email: "a@a.com",password_confirmation:"123456")
        b_user = User.authenticate_with_credentials("a@a.com","123456")
        expect(b_user).to eq(a_user)
      end

      it 'returns false if user has invalid password' do
        a_user = User.create(name:"Joey Bacon", password: "123456", email: "a@a.com",password_confirmation:"123456")
        b_user = User.authenticate_with_credentials("a@a.com","12345A")
        expect(b_user).to be nil
      end

      it 'returns true if user added extra spaces to the email' do
        a_user = User.create(name:"Joey Bacon", password: "123456", email: "a@a.com",password_confirmation:"123456")
        b_user = User.authenticate_with_credentials(" a@a.com ","123456")
        expect(b_user).to eq(a_user)
      end

      it 'returns true if user added had wrong case fore email' do
        a_user = User.create(name:"Joey Bacon", password: "123456", email: "a@a.com",password_confirmation:"123456")
        b_user = User.authenticate_with_credentials("A@a.com ","123456")
        expect(b_user).to eq(a_user)
      end
    end

end
