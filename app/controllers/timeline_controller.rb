class TimelineController < ApplicationController

  def show
    @posts = current_user.profile.home
  end

  def create
    current_user.profile.feed!(
      :message => params[:message]
    )
    redirect_to timeline_url
  end

end
