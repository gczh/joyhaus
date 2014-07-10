json.array!(@products) do |product|
  json.extract! product, :id, :sku, :name, :description, :price, :cost_price, :weight, :on_sale, :featured
  json.url product_url(product, format: :json)
end
