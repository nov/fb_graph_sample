class DashboardController < ApplicationController
  before_filter :require_authentication

  def show
    @posts = current_user.profile.home
  end

end
