require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  include Warden::Test::Helpers
  describe 'Categories' do
    before(:each) do
      User.destroy_all
      @user = User.create(id: 1, first_name: 'Amigo', last_name: 'Soy',
                          email: 'my@email.com', password: '321321')
      @group = Group.create(id: 1, author: @user, icon: 1, name: 'Food')
      @movement = Movement.create(id: 1, author: @user, name: 'Pizza', amount: 50, group_ids: [1])
    end

    it 'shows home page if not logged' do
      visit '/groups'
      expect(page).to have_content('You need to')
    end

    it 'Shows categories on logged users' do
      login_as @user
      visit '/'
      expect(page).to have_content('CATEGORIES')
    end

    it 'Adds new categories' do
      login_as @user
      visit '/'
      click_link 'ADD NEW CATEGORY'
      fill_in 'Name', with: 'Food'
      choose 'group_icon_2'
      click_button 'Save'
      expect(page).to have_content('Group was successfully created')
    end
  end
end
