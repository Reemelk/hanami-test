require 'hanami/validations/form'

class SigninValidator
  include Hanami::Validations::Form

  validations do
    required(:user).schema do
      required(:email).filled(:str?, format?: /@/)
      required(:password).filled(:str?, min_size?: 8)
    end
  end
end
