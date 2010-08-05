module Authentication

  def self.included(base)
    base.send(:include, Authentication::HelperMethods)
    base.send(:include, Authentication::ControllerMethods)
  end

  module HelperMethods

    def current_user
      @current_user ||= Facebook.find(session[:current_user])
    rescue ActiveRecord::RecordNotFound
      nil
    end

    def authenticated?
      !current_user.blank?
    end

  end

  module ControllerMethods

    def require_authentication
      authenticate Facebook.find(session[:current_user])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_url
    end

    def authenticate(user)
      session[:current_user] = user.id
    end

  end

end