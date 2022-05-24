require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/users', type: :request do
  include Warden::Test::Helpers
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  before(:example) do
    User.destroy_all
    Group.destroy_all
    Movement.destroy_all
    @user = User.create!(id: 1, first_name: 'Amigo', last_name: 'Soy',
                         email: 'my@email.com', password: '321321')
    @group = Group.create(id: 1, author: @user, icon: 1, name: 'Food')
    @movement = Movement.create(id: 1, author: @user, name: 'Pizza', amount: 50, group_ids: [1])
  end

  describe 'GET /' do
    it 'renders a successful response' do
      get '/'
      expect(response).to be_successful
    end

    it 'renders a home if not user is not logged' do
      get '/'
      expect(response.body).to include('Mi Platica')
    end

    it 'renders categories if user is logged' do
      login_as @user, scope: :user
      get '/'
      expect(response.body).to include('CATEGORIES')
    end
  end

  # describe 'GET /show' do
  #   it 'renders a successful response' do
  #     user = User.create! valid_attributes
  #     get user_url(user)
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET /new' do
  #   it 'renders a successful response' do
  #     get new_user_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET /edit' do
  #   it 'renders a successful response' do
  #     user = User.create! valid_attributes
  #     get edit_user_url(user)
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     it 'creates a new User' do
  #       expect do
  #         post users_url, params: { user: valid_attributes }
  #       end.to change(User, :count).by(1)
  #     end

  #     it 'redirects to the created user' do
  #       post users_url, params: { user: valid_attributes }
  #       expect(response).to redirect_to(user_url(User.last))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new User' do
  #       expect do
  #         post users_url, params: { user: invalid_attributes }
  #       end.to change(User, :count).by(0)
  #     end

  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post users_url, params: { user: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested user' do
  #       user = User.create! valid_attributes
  #       patch user_url(user), params: { user: new_attributes }
  #       user.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'redirects to the user' do
  #       user = User.create! valid_attributes
  #       patch user_url(user), params: { user: new_attributes }
  #       user.reload
  #       expect(response).to redirect_to(user_url(user))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       user = User.create! valid_attributes
  #       patch user_url(user), params: { user: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested user' do
  #     user = User.create! valid_attributes
  #     expect do
  #       delete user_url(user)
  #     end.to change(User, :count).by(-1)
  #   end

  #   it 'redirects to the users list' do
  #     user = User.create! valid_attributes
  #     delete user_url(user)
  #     expect(response).to redirect_to(users_url)
  #   end
  # end
end
