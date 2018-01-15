class Signin
  def initialize(params)
    @params = params
  end

  def call
    check_params ? authenticate : false
  end

  def user_id
    @user.id
  end

  private

  def check_params
    result = SigninValidator.new(@params).validate
    result.success? ? true : false
  end

  def authenticate
    @user = UserRepository.new.find_by_email(@params[:user][:email])
    return false if @user.nil?
    Argon2::Password.verify_password(@params[:user][:password], @user.digest_password)
  end
end
