json.array!(@orders) do |order|
  json.extract! order, :id, :total, :restaurant_id, :user_id
  json.url order_url(order, format: :json)
end
