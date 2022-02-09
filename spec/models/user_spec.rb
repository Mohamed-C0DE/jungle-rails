require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    describe 'password and password confirmation' do
      # it "password fields must be filled" do
      #   user1 = User.create(
      #     name: 'John', 
      #     email: 'john@example.com',
      #     password_confirmation: 'password'
      #   )
      #   p user1.errors.full_messages
      #   expect(user1.errors.full_messages).to include("Password can't be blank")
      # end

      # it "password confirmation field must be filled" do
      #   user1 = User.create(
      #     name: 'John', 
      #     email: 'john@example.com',
      #     password: 'password'
      #   )
      #   p user1.errors.full_messages
      #   expect(user1.errors.full_messages).to include("Password confirmation can't be blank")
      # end

      # it "password and password confirmation fields must match" do
      #   user1 = User.create(
      #     name: 'John', 
      #     email: 'john@example.com',
      #     password: 'password',
      #     password_confirmation: 'passwordss'
      #   )
      #   p user1.errors.full_messages
      #   expect(user1.password).to eq(user1.password_confirmation)
      # end

      it "should have more than 3 characters" do
        user1 = User.create(
          name: 'John', 
          email: 'john@example.com',
          password: 'pa',
          password_confirmation: 'pa'
        )
        p user1.errors.full_messages
        expect(user1.errors.full_messages).to include("Password confirmation is too short (minimum is 3 characters)")
      end
    end

    # describe "Email" do
    #   it "should be unique" do
    #     user1 = User.create(
    #       name: 'John', 
    #       email: 'john@example.com',
    #       password: 'password',
    #       password_confirmation: 'password'
    #     )
    #     user2 = User.create(
    #       name: 'John', 
    #       email: 'john@example.com',
    #       password: 'password',
    #       password_confirmation: 'password'
    #     )
    #     expect(user2.errors.full_messages).to include("Email has already been taken")
        
    #   end
    # end

    describe '.authenticate_with_credentials' do
      # it "should return user" do
      #   # examples for this class method here
      # user1 = User.create(
      #   name: 'John', 
      #   email: 'wic2k@example.com',
      #   password: 'password1',
      #   password_confirmation: 'password1'
      # )
      # p User.authenticate_with_credentials(user1.email, user1.password)
      # expect(User.authenticate_with_credentials('wic2k@example.com', 'password1')).to eq(user1)
      # end

      # it "should return user even with spaces before and after email" do
      #   # examples for this class method here
      #   user1 = User.create(
      #     name: 'John', 
      #     email: "example@domain.com",
      #     password: 'password1',
      #     password_confirmation: 'password1'
      #   )
      #   expect(User.authenticate_with_credentials(" example@domain.com ", 'password1')).to eq(user1)
      # end

      it "should be authenticated with wrong case for their email" do
        user1 = User.create(
          name: 'Johna', 
          email: "example1@domain.com",
          password: 'password1',
          password_confirmation: 'password1'
        )
        expect(User.authenticate_with_credentials("examplE1@domain.com", 'password1')).to eq(user1)
      end

    end


  end
end
