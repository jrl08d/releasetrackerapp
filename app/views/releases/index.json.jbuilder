json.array!(@releases) do |release|
  json.extract! release, :id, :version, :comments
  json.url release_url(release, format: :json)
end
