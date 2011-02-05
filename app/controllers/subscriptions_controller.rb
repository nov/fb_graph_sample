class SubscriptionsController < ApplicationController

  def show
    render :text => params[:'hub.challenge']
  end

  def create
    render :nothing => true, :status => 205
  end

end
