json.array!(@products) do |product|
  json.extract! product, :name, :countlike
  
end
