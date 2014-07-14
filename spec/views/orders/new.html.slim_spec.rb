require 'rails_helper'

RSpec.describe "orders/new", :type => :view do
  before(:each) do
    assign(:order, Order.new(
      :user_id => 1,
      :status => 1,
      :email => "MyString",
      :name => "MyString",
      :address => "MyString",
      :postal_code => 1,
      :phone_number => 1,
      :discount => "9.99",
      :payment_method => 1,
      :shipping_method => 1,
      :notes => "MyText",
      :mail_number => "MyString",
      :mail_type => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_status[name=?]", "order[status]"

      assert_select "input#order_email[name=?]", "order[email]"

      assert_select "input#order_name[name=?]", "order[name]"

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_postal_code[name=?]", "order[postal_code]"

      assert_select "input#order_phone_number[name=?]", "order[phone_number]"

      assert_select "input#order_discount[name=?]", "order[discount]"

      assert_select "input#order_payment_method[name=?]", "order[payment_method]"

      assert_select "input#order_shipping_method[name=?]", "order[shipping_method]"

      assert_select "textarea#order_notes[name=?]", "order[notes]"

      assert_select "input#order_mail_number[name=?]", "order[mail_number]"

      assert_select "input#order_mail_type[name=?]", "order[mail_type]"
    end
  end
end
