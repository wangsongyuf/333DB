json.array!(@departments) do |department|
  json.extract! department, :id, :Name, :Phone, :Email, :CID
  json.url department_url(department, format: :json)
end
