require 'rails_helper'

RSpec.describe 'Movement', type: :feature do
  include Warden::Test::Helpers
  describe 'Movements' do
    before(:each) do
      User.destroy_all
      @user = User.create(id: 1, first_name: 'Amigo', last_name: 'Soy',
                          email: 'my@email.com', password: '321321')
      @group = Group.create(id: 1, author: @user, icon: 1, name: 'Food')
      @movement = Movement.create(id: 1, author: @user, name: 'Pizza', amount: 50, group_ids: [1])
    end

    it 'shows home page if not logged' do
      visit "/groups/#{@group.id}/movements"
      expect(page).to have_content('You need to')
    end

    it 'Shows new transaction form' do
      login_as @user
      visit "/groups/#{@group.id}/movements"
      expect(page).to have_content('NEW TRANSACTION')
    end

    it 'Adds new transaction' do
      login_as @user
      visit "/groups/#{@group.id}/movements"
      fill_in 'Name', with: 'Pizza'
      fill_in 'movement[amount]', with: 30
      check 'movement_group_ids_1'
      click_button 'SAVE'
      expect(page).to have_content('Movement was successfully created')
    end
  end
end
