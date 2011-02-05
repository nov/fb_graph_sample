class TopController < ApplicationController

  def index
    redirect_to dashboard_url if authenticated?
  end

end
