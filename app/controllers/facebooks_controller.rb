class FacebooksController < ApplicationController

  def show
    auth = FbGraph::Auth.new Facebook.config[:client_id], Facebook.config[:client_secret]
    auth.from_cookie cookies
    # cookies
    @fb_user = auth.user
    puts @fb_user.access_token.inspect
  rescue FbGraph::Auth::VerificationFailed => e
    flash[:error] = {
      :title => "VerificationFailed",
      :message => e.message
    }
    redirect_to root_url
  end

end
