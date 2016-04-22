require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, create(:item).decorate)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@item.description}/)
    expect(rendered).to match(/#{@item.object.source}/)
    expect(rendered).to match(/#{@item.url}/)
  end
end
