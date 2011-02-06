FbGraphSample::Application.routes.draw do
  resource :facebook, :except => :create do
    get :callback, :to => :create
  end

  resource :dashboard, :only => :show
  resource :profile, :only => :show
  resource :timeline, :only => [:show, :create]
  resource :subscription, :only => [:show, :create]

  root :to => 'top#index'
end
