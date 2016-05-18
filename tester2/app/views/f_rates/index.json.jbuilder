json.array!(@f_rates) do |f_rate|
  json.extract! f_rate, :id, :FID, :UUID, :Rating, :Comment
  json.url f_rate_url(f_rate, format: :json)
end
