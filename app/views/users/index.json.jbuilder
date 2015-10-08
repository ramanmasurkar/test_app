json.aaData(@users) do |user|
  o = []
  o << user.id
  o << user.email
  json.array! o
end