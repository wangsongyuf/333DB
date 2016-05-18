json.array!(@c_rates) do |c_rate|
  json.extract! c_rate, :id, :CID, :UUID, :Rating, :Comment
  json.url c_rate_url(c_rate, format: :json)
end
