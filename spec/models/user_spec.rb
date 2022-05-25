require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    before(:example) do
      User.destroy_all
      @user = User.create(first_name: 'Amigo', last_name: 'Soy',
                          email: 'my@email.com', password: '321321')
    end

    it 'is invalid if names are empty' do
      @user.first_name = nil
      expect(@user).to_not be_valid
      @user.first_name = 'Amigo'
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it 'is valid if proper names are added' do
      @user.first_name = 'Amigo'
      @user.last_name = 'Hola'
      expect(@user).to be_valid
    end
  end
end
