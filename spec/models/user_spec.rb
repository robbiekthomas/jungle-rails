require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'passes validation' do
      user = User.new(name: "test", password: "asdfasdf", password_confirmation: "asdfasdf", email: "test@test.com", )
      expect(user).to be_valid
    end
    it 'requires a password' do
      user = User.new(name: "test", password: nil, email: "test@test.com", )
      expect(user).not_to be_valid
    end
    it 'requires password to match confirmation' do
      user = User.new(name: "test", password: "asdfasdf", password_confirmation: "asdf1234", email: "test@test.com", )
      expect(user).not_to be_valid
    end
    it 'requires password to be 8 characters' do
      user = User.new(name: "test", password: "asdf", password_confirmation: "asdf", email: "test@test.com", )
      expect(user).not_to be_valid
    end
    it 'requires a name' do
      user = User.new(name: nil, password: "asdfasdf", password_confirmation: "asdfasdf", email: "test@test.com", )
      expect(user).not_to be_valid
    end
    it 'requires a unique email' do
      user1 = User.create(name: "test", password: "asdfasdf", password_confirmation: "asdfasdf", email: "test@test.com", )
      user2 = User.new(name: "test", password: "asdfasdf", password_confirmation: "asdfasdf", email: "test@test.com", )
      expect(user2).not_to be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(name: 'John Doe', email: 'johndoe@example.com', password: 'password', password_confirmation: 'password')
    end
    it "authenticates when given valid credentials" do
      authenticated_user = User.authenticate_with_credentials('johndoe@example.com', 'password')
      expect(authenticated_user).to eq(@user)
    end
    it "does not authenticate when given invalid credentials" do
      authenticated_user = User.authenticate_with_credentials('johndoe@example.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end
    it "authenticates with leading/trailing whitespace in email" do
      authenticated_user = User.authenticate_with_credentials('  johndoe@example.com  ', 'password')
      expect(authenticated_user).to eq(@user)
    end
    it "authenticates with different case in email" do
      authenticated_user = User.authenticate_with_credentials('JOHNDOE@example.com', 'password')
      expect(authenticated_user).to eq(@user)
    end
  end

end
