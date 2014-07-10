class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :cost_price
      t.decimal :weight
      t.boolean :on_sale
      t.boolean :featured

      t.timestamps
    end
  end
end
