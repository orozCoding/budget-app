require 'rails_helper'

RSpec.describe Movement, type: :model do
  describe 'Movement model' do
    before(:example) do
      User.destroy_all
      @user = User.create(id: 1, first_name: 'Amigo', last_name: 'Soy',
                          email: 'my@email.com', password: '321321')
      @group = Group.create(id: 1, author: @user, icon: 1, name: 'Food')
      @movement = Movement.create(id: 1, author: @user, name: 'Pizza', amount: 50, group_ids: [1])
    end

    it 'is invalid if fields are empty or filled incorrectly' do
      @movement.name = nil
      expect(@movement).to_not be_valid
      @movement.name = 'Pizza'
      @movement.amount = -1
      expect(@movement).to_not be_valid
      @movement.amount = 0
      expect(@movement).to_not be_valid
      @movement.amount = 'yes'
      expect(@movement).to_not be_valid
    end

    it 'is valid if fields are properly filled' do
      @movement.name = 'Pizza'
      @movement.amount = 50
      expect(@movement).to be_valid
    end
  end
end
