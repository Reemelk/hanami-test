module Web::Controllers::Accounts
  class Create
    include Web::Action

    def call(params)
      signup = Signup.new(params)
      signup.call
      if signup
        flash[:success] = 'You are now registered. You can sign in'
        redirect_to routes.get_signin_path
      else
        self.status = 422
        signup.errors
      end
    end
  end
end
