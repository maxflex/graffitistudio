json.array!(@linkdumps) do |linkdump|
  json.extract! linkdump, :id, :url
  # json.url linkdump_url(linkdump, format: :json)
end
