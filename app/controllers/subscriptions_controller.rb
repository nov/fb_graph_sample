class SubscriptionsController < ApplicationController
  def show
    render :text => params.inspect
  end

  def create
    render :text => params[:'hub.challenge']
  end
end
