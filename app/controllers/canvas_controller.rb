class CanvasController < ApplicationController
  def show
    redirect_to Facebook.config[:canvas_url]
  end

  def create
    @auth = Facebook.auth.from_signed_request(params[:signed_request])
    if @auth.authorized?
      authenticate Facebook.identify(@auth.user)
      render :show
    else
      render :authorize
    end
  end
end
