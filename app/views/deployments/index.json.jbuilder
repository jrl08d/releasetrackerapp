json.array!(@deployments) do |deployment|
  json.extract! deployment, :id, :deploy_date
  json.url deployment_url(deployment, format: :json)
end
