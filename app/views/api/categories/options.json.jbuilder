json.array! @categories do |category|
    json.value category.id
    json.label category.title
end