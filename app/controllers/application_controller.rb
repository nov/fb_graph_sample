class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery

  rescue_from FbGraph::Exception, :with => :fb_graph_exception

  def fb_graph_exception(e)
    flash[:error] = {
      :title   => e.class,
      :message => e.message
    }
    redirect_to root_url
  end

end
