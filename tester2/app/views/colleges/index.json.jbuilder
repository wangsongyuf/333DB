json.array!(@colleges) do |college|
  json.extract! college, :id, :Name, :Ranking, :Tuition, :FundingOption, :AverageStandardizedTestScore, :InState, :AtAddress
  json.url college_url(college, format: :json)
end
