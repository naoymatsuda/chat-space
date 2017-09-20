json.array! @reload_chat.each do |chat|
  json.name     chat.user.name
  json.date     chat.created_at
  json.text     chat.text
  json.image    chat.image
  json.id       chat.id
end
