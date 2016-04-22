require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    user = create :user
    assign(:user, user)
    assign(:items, create_list(:link, 2, user: user).map(&:decorate))
  end

  it "renders a list of items" do
    render
    assert_select "img", :alt => "Link".to_s, :count => 2
    assert_select "img", :title => "Link".to_s, :count => 2
  end
end
