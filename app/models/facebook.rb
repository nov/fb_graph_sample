class Facebook < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  def self.config
    {
      :client_id     => "b970b24f039c62ef51059ab1029d103f",
      :client_secret => "939b5e2ef40b1e58cad08b4416f21337"
    }
  end

  def self.identify(fb_user)
    _fb_user_ = find_or_initialize_by_identifier(fb_user.identifier)
    _fb_user_.access_token = fb_user.access_token.token
    _fb_user_.expires_in = fb_user.access_token.expires_in
    _fb_user_.save!
    _fb_user_
  end

  def expired?
    self.expired_at.zero? ||
    self.created_at + self.expired_in <= Time.now.utc
  end

  def profile
    FbGraph::User.me(self.access_token).fetch
  end
  memoize :profile

end
