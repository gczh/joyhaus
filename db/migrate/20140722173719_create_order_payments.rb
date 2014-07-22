class CreateOrderPayments < ActiveRecord::Migration
  def change
    create_table :order_payments do |t|
      t.integer :order_id
      t.string :transaction_id
      t.string :ibanking_nick
      t.datetime :transaction_datetime

      t.timestamps
    end
  end
end
