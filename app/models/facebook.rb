class Facebook < ActiveRecord::Base

  def self.config
    {
      :client_id     => "b970b24f039c62ef51059ab1029d103f",
      :client_secret => "939b5e2ef40b1e58cad08b4416f21337"
    }
  end

end
