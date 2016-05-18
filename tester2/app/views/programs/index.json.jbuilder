json.array!(@programs) do |program|
  json.extract! program, :id, :Name, :USNewsRanking, :PrincetonReviewRanking, :CID, :DID
  json.url program_url(program, format: :json)
end
