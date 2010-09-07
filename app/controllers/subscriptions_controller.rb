class SubscriptionsController < ApplicationController
  def create
    render :text => params[:'hub.challenge']
  end
end
