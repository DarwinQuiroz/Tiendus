require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :user => nil,
      :name => "Name",
      :pricing => "9.99",
      :descripction => "MyText",
      :avatar => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
