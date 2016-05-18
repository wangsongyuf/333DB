json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :Name, :Area, :Email
  json.url faculty_url(faculty, format: :json)
end
