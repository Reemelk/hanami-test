class Signup
  def initialize(params)
    @params = params
  end

  def call
    check_params ? create_user : false
  end

  def errors
    @errors
  end

  private

  def check_params
    result = SignupValidator.new(@params).validate
    return true if result.success?

    result.errors[:user].each do |key, value|
      @errors = []
      @errors << {"#{key}": value}
    end
    return false
  end

  def create_user
    begin
      UserRepository.new.create(email: @params[:user][:email], digest_password: password_hash(@params[:user][:password]))
    rescue Hanami::Model::UniqueConstraintViolationError, PG::UniqueViolation
      @errors = {email: ["already exists"]}
      return false
    else
      return true
    end
  end

  def password_hash(pwd)
    Argon2::Password.create(pwd)
  end
end
