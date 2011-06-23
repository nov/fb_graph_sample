FbGraphSample::Application.routes.draw do
  resource :facebook, :except => :create do
    get :callback, :to => :create
  end

  resource :dashboard, :only => :show
  resource :canvas, :only => [:show, :create]
  resource :profile, :only => :show
  resource :timeline, :only => [:show, :create]
  resources :subscriptions, :except => [:new, :edit, :destroy]

  root :to => 'top#index'
end
