json.extract! bill, :id, :author_id, :name, :amount, :created_at, :updated_at
json.url bill_url(bill, format: :json)
