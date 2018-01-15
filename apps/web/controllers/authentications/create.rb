module Web::Controllers::Authentications
  class Create
    include Web::Action

    def call(params)
      signin = Signin.new(params)
      signin.call
      if signin
        session[:user_id] = signin.user_id
        flash[:success] = 'You are now logged in !'
        redirect_to routes.root_path
      else
        self.status = 401
      end
    end
  end
end
