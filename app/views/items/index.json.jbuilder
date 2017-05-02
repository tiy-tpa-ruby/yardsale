json.array! @items do |item|
  json.id item.id
  json.link item_url(item)
  json.name item.name
  json.description item.description
  json.image_url item.image_url(:medium)
end
