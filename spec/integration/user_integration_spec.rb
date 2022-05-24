require 'rails_helper'

RSpec.describe 'User home', type: :feature do
  include Warden::Test::Helpers
  describe 'User' do
    before(:each) do
      User.destroy_all
      @user = User.create(id: 1, first_name: 'Amigo', last_name: 'Soy',
                          email: 'my@email.com', password: '321321')
      @group = Group.create(id: 1, author: @user, icon: 1, name: 'Food')
      @movement = Movement.create(id: 1, author: @user, name: 'Pizza', amount: 50, group_ids: [1])
    end

    it 'shows home page if not logged' do
      visit '/'
      expect(page).to have_content('Mi Platica')
    end

    it 'Logs in correctly' do
      visit '/'
      click_button 'Log In'
      fill_in 'Email', with: 'my@email.com'
      fill_in 'Password', with: '321321'
      click_button 'Log in'
      expect(page).to have_content('Categories')
    end

    it 'Registers in correctly' do
      visit '/'
      click_button 'Sign Up'
      fill_in 'First name', with: 'Angel'
      fill_in 'Last name', with: 'Orozco'
      fill_in 'Email', with: 'my2@email.com'
      fill_in 'Password', with: '321321'
      fill_in 'Password confirmation', with: '321321'
      click_button 'Sign up'
      expect(page).to have_content('Categories')
    end
  end
end
