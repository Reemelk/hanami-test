module Web
  module Helpers
    module Auth
      private
      def current_user
        @current_user ||= UserRepository.new.find(session[:user_id])
      end
    end
  end
end
