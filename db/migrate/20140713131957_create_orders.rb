class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :reference_id
      t.integer :user_id
      t.integer :status
      t.string :email
      t.string :name
      t.string :address
      t.integer :postal_code
      t.integer :phone_number
      t.decimal :discount
      t.decimal :subtotal
      t.integer :payment_method
      t.integer :shipping_method
      t.text :notes
      t.string :mail_number
      t.string :mail_type
      t.string :transaction_id
      t.string :ibanking_nick
      t.datetime :transaction_datetime

      t.timestamps
    end
  end
end
