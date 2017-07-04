require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :user => nil,
      :name => "MyString",
      :pricing => "9.99",
      :descripction => "MyText",
      :avatar => ""
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_user_id[name=?]", "product[user_id]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_pricing[name=?]", "product[pricing]"

      assert_select "textarea#product_descripction[name=?]", "product[descripction]"

      assert_select "input#product_avatar[name=?]", "product[avatar]"
    end
  end
end
