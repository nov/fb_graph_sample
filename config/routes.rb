FbGraphSample::Application.routes.draw do
  resource :facebook, :except => :create do
    get :callback, :to => :create
  end

  resource :subscription, :only => [:show, :create]
  resource :dashboard, :only => :show
  resource :timeline, :only => [:show, :create]

  root :to => 'top#index'
end
