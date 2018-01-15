module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        expose :current_user
      end
    end

    private

    def authenticate!
      redirect_to routes.get_signin_path unless authenticated?
    end

    def authenticated?
      !!current_user
    end

    def current_user
      @current_user ||= UserRepository.new.find(session[:user_id])
    end
  end
end
