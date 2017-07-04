require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :user => nil,
        :name => "Name",
        :pricing => "9.99",
        :descripction => "MyText",
        :avatar => ""
      ),
      Product.create!(
        :user => nil,
        :name => "Name",
        :pricing => "9.99",
        :descripction => "MyText",
        :avatar => ""
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
