class Subscription < ActiveRecord::Base
  belongs_to :facebook

  validates :facebook, :object, :fields, :history_json, :verify_token, :presence => true

  before_validation :setup, :on => :create

  def history
    JSON.parse(self.history_json)
  end

  def history=(history)
    self.history_json = history.to_json
  end

  def subscribe!(callback)
    Facebook.app.subscribe!(
      :object => self.object,
      :fields => self.fields,
      :callback_url => callback,
      :verify_token => self.verify_token
    )
  end

  private

  def setup
    self.verify_token = ActiveSupport::SecureRandom.hex(16)
    self.history = []
  end

end
