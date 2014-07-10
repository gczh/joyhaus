require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :sku => "Sku",
        :name => "Name",
        :description => "MyText",
        :price => "9.99",
        :cost_price => "9.99",
        :weight => "9.99",
        :on_sale => false,
        :featured => false
      ),
      Product.create!(
        :sku => "Sku",
        :name => "Name",
        :description => "MyText",
        :price => "9.99",
        :cost_price => "9.99",
        :weight => "9.99",
        :on_sale => false,
        :featured => false
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
