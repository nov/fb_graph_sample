class FacebooksController < ApplicationController
  rescue_from FbGraph::Auth::VerificationFailed, :with => :verification_failed

  def show
    auth = FbGraph::Auth.new Facebook.config[:client_id], Facebook.config[:client_secret]
    auth.from_cookie cookies
    authenticate Facebook.identify(auth.user)
    redirect_to dashboard_url
  end

  private

  def verification_failed(e)
    flash[:error] = {
      :title => "VerificationFailed",
      :message => e.message
    }
    redirect_to root_url
  end

end
