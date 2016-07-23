json.array!(@email_users) do |email_user|
  json.extract! email_user, :id, :name, :email, :login
  json.url email_user_url(email_user, format: :json)
end
