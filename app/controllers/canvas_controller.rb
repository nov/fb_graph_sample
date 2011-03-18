class CanvasController < ApplicationController
  def create
    auth = Facebook.auth.from_signed_request(params[:signed_request])
    if auth.authorized?
      user = auth.user.fetch
      render :text => "Hello #{user.name}!"
    else
      redirect_to auth.authorize_uri(canvas_url)
    end
  end
end
