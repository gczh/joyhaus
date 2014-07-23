require 'rails_helper'

RSpec.describe "orders/index", :type => :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
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
      ),
      Order.create!(
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
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Mail Number".to_s, :count => 2
    assert_select "tr>td", :text => "Mail Type".to_s, :count => 2
  end
end
