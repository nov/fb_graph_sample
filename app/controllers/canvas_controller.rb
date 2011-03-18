class CanvasController < ApplicationController
  layout false

  def show
    redirect_to 'http://apps.facebook.com/fbgraphsample/'
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
