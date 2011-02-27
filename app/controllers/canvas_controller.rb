class CanvasController < ApplicationController
  def create
    auth = lFacebook.auth.from_signed_request(params)
    user = auth.user.fetch
    render :text => "Hello #{user.name}!"
  end
end
