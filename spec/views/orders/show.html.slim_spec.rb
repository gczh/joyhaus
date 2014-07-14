require 'rails_helper'

RSpec.describe "orders/show", :type => :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :user_id => 1,
      :status => 2,
      :email => "Email",
      :name => "Name",
      :address => "Address",
      :postal_code => 3,
      :phone_number => 4,
      :discount => "9.99",
      :payment_method => 5,
      :shipping_method => 6,
      :notes => "MyText",
      :mail_number => "Mail Number",
      :mail_type => "Mail Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Mail Number/)
    expect(rendered).to match(/Mail Type/)
  end
end
