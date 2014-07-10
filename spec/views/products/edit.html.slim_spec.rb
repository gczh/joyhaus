require 'rails_helper'

RSpec.describe "products/edit", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :sku => "MyString",
      :name => "MyString",
      :description => "MyText",
      :price => "9.99",
      :cost_price => "9.99",
      :weight => "9.99",
      :on_sale => false,
      :featured => false
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_sku[name=?]", "product[sku]"

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "input#product_price[name=?]", "product[price]"

      assert_select "input#product_cost_price[name=?]", "product[cost_price]"

      assert_select "input#product_weight[name=?]", "product[weight]"

      assert_select "input#product_on_sale[name=?]", "product[on_sale]"

      assert_select "input#product_featured[name=?]", "product[featured]"
    end
  end
end
