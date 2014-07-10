require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :sku => "Sku",
      :name => "Name",
      :description => "MyText",
      :price => "9.99",
      :cost_price => "9.99",
      :weight => "9.99",
      :on_sale => false,
      :featured => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
