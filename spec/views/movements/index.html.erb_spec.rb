require 'rails_helper'

RSpec.describe 'movements/index', type: :view do
  before(:each) do
    assign(:movements, [
             Movement.create!(
               name: 'Name',
               amount: 2
             ),
             Movement.create!(
               name: 'Name',
               amount: 2
             )
           ])
  end

  it 'renders a list of movements' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
