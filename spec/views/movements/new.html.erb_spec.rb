require 'rails_helper'

RSpec.describe "movements/new", type: :view do
  before(:each) do
    assign(:movement, Movement.new(
      name: "MyString",
      amount: 1
    ))
  end

  it "renders new movement form" do
    render

    assert_select "form[action=?][method=?]", movements_path, "post" do

      assert_select "input[name=?]", "movement[name]"

      assert_select "input[name=?]", "movement[amount]"
    end
  end
end
