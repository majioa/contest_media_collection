require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, build(:link).decorate)
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "textarea#item_description[name=?]", "item[description]"

      assert_select "input#item_source[name=?]", "item[source]"
    end
  end
end
