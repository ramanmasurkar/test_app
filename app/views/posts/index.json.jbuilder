json.array!(@posts) do |post|
  json.extract! post, :id, :title, :reviewed
  json.url post_url(post, format: :json)
end
