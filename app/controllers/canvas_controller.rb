class CanvasController < ApplicationController
  def show
    render :text => 'Thanks for your authorization!'
  end

  def create
    auth = Facebook.auth.from_signed_request(params[:signed_request])
    if auth.authorized?
      user = auth.user.fetch
      render :text => "Hello #{user.name}!"
    else
      render :text => javascript_tag <<-JS
        top.location.href = "#{auth.authorize_uri(canvas_url)}";
      JS
    end
  end
end
