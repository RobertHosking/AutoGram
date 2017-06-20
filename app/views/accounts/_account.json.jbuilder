json.extract! account, :id, :username, :password, :tags, :comments, :comment_percentage, :instagram_token, :category_id, :created_at, :updated_at
json.url account_url(account, format: :json)