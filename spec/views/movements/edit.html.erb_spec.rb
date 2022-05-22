require 'rails_helper'

RSpec.describe 'movements/edit', type: :view do
  before(:each) do
    @movement = assign(:movement, Movement.create!(
                                    name: 'MyString',
                                    amount: 1
                                  ))
  end

  it 'renders the edit movement form' do
    render

    assert_select 'form[action=?][method=?]', movement_path(@movement), 'post' do
      assert_select 'input[name=?]', 'movement[name]'

      assert_select 'input[name=?]', 'movement[amount]'
    end
  end
end
