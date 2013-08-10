class PasswordForm
  # Rails 4: include ActiveRecord::Model
  extend ActiveRecord::Naming
  include ActiveRecord::Conversion
  include ActiveRecord::Validations

  def persisted?
    false
  end


  attr_accessor :original_password, :new_password
  validate :verify_original_password
  validates_presence_of :original_password, :new_password
  validates_confirmation_of :new_password
  validates_length_of :new_password, minimum: 6
end
