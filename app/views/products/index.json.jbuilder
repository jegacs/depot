json.array!(@products) do |product|
  json.extract! product, :id, :user_id, :name, :price
  json.url product_url(product, format: :json)
end
