json.extract! product, :id, :user_id, :name, :pricing, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
