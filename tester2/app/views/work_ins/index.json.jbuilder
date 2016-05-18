json.array!(@work_ins) do |work_in|
  json.extract! work_in, :id, :FID, :DID
  json.url work_in_url(work_in, format: :json)
end
