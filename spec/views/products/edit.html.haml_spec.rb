require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :user => nil,
      :name => "MyString",
      :pricing => "9.99",
      :descripction => "MyText",
      :avatar => ""
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_user_id[name=?]", "product[user_id]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_pricing[name=?]", "product[pricing]"

      assert_select "textarea#product_descripction[name=?]", "product[descripction]"

      assert_select "input#product_avatar[name=?]", "product[avatar]"
    end
  end
end
