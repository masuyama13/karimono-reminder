# frozen_string_literal: true

json.extract! user, :id, :name, :email, :password_digest, :notification, :last_accessed_at, :created_at, :updated_at
json.url user_url(user, format: :json)
