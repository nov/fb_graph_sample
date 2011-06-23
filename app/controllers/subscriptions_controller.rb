class SubscriptionsController < ApplicationController
  before_filter :require_authentication, :only => [:index, :create]

  def index
  end

  # for Subscription Verification
  def show
    subscription = Subscription.find(params[:id])
    if subscription.verify_token == params[:'hub.verify_token']
      render :text => params[:'hub.challenge']
    else
      render :text => 'verify_token invalid', :status => 401
    end
  end

  def create
    subscription = current_user.subscriptions.build(params[:subscription])
    if subscription.save
      subscription.subscribe! subscription_url(subscription)
    else
      flash[:error] = {
        :title   => 'Invalid',
        :message => subscription.errors.full_messages.to_sentence
      }
    end
    redirect_to subscriptions_url
  end

  # for Change Notifications
  def update
    subscription = Subscription.find(params[:id])
    subscription.history = Array(subscription.history) + Array(params[:entry])
    subscription.save
    render :nothing => true
  end

end
