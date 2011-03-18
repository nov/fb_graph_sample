class CanvasController < ApplicationController
  layout false

  def show
    render :text => 'Thanks for your authorization!'
  end

  def create
    @auth = Facebook.auth.from_signed_request(params[:signed_request])
    if @auth.authorized?
      authenticate @auth.user
      render :show
    else
      render :authorize
    end
  end
end
