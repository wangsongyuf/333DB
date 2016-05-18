json.array!(@supervises) do |supervise|
  json.extract! supervise, :id, :FID, :PID
  json.url supervise_url(supervise, format: :json)
end
