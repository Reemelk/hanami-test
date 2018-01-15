class UserRepository < Hanami::Repository
  def find_by_email(param_email)
    users.where(email: param_email).as(User).one
  end
end
