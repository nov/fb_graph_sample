class CanvasController < ApplicationController
  def create
    auth = Facebook.auth.from_signed_request(params[:signed_request])
    if auth.authorized?
      user = auth.user.fetch
      render :text => "Hello #{user.name}!"
    else
      render :text => "Hello Anonymous!"
    end
  end
end
