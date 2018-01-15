require 'hanami/validations/form'

class SignupValidator
  include Hanami::Validations::Form

  validations do
    required(:user).schema do
      required(:email).filled(:str?, format?: /@/)
      required(:password).filled(:str?, min_size?: 8).confirmation
    end
  end
end
