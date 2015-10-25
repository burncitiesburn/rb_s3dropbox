json.array!(@file_shares) do |file_share|
  json.extract! file_share, :id, :user, :file_url
  json.url file_share_url(file_share, format: :json)
end
