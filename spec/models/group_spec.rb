require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group model' do
    before(:example) do
      User.destroy_all
      @user = User.create(id: 1, first_name: 'Amigo', last_name: 'Soy',
                          email: 'my@email.com', password: '321321')
      @group = Group.create(id: 1, author: @user, icon: 1, name: 'Food')
    end

    it 'is invalid if fields are empty or filled incorrectly' do
      @group.icon = nil
      expect(@group).to_not be_valid
      @group.icon = 555
      expect(@group).to_not be_valid
      @group.icon = -1
      expect(@group).to_not be_valid
      @group.icon = 0
      expect(@group).to_not be_valid
      @group.icon = 'yes'
      expect(@group).to_not be_valid
      @group.icon = 1
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'is valid if fields are properly filled' do
      @group.icon = 1
      @group.name = 'Food'
      expect(@group).to be_valid
      @group.icon = 40
      @group.name = 'Mamaaaaaaaaaaaaaaaa'
      expect(@group).to be_valid
    end
  end
end
