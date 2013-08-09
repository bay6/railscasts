class PasswordForm
  include ActiveModel::Model

  attr_accessor :original_password, :new_password
  validate :verify_original_password
  validate_presence_of :original_password, :new_password
  validate_confirmation_of :new_password
  validate_length_of :new_password, minimum: 6

  def initialize(user)
    @user = user
  end

  def verify_original_password
    unless @user.authenticate(original_password)
      errors.add :original_password, "is not correct"
    end
  end

  def change_password
    @user.password = new_password
  end
end
