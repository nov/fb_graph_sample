class Facebook < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  def profile
    FbGraph::User.me(self.access_token).fetch
  end
  memoize :profile

  class << self
    extend ActiveSupport::Memoizable

    def config
      @config ||= YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env].symbolize_keys
    rescue => e
      raise StandardError.new("config/facebook.yml could not be loaded.")
    end
    memoize :config

    def auth
      FbGraph::Auth.new config[:client_id], config[:client_secret]
    end
    memoize :auth

    def identify(fb_user)
      _fb_user_ = find_or_initialize_by_identifier(fb_user.identifier)
      _fb_user_.access_token = fb_user.access_token.token
      _fb_user_.expires_in = fb_user.access_token.expires_in
      _fb_user_.save!
      _fb_user_
    end
  end

end
