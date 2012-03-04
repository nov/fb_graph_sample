if Rails.env.development?
  FbGraph.logger = Rack::OAuth2.logger = Rails.logger
  FbGraph.debug!
end