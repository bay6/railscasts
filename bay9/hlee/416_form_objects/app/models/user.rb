class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :changing_password, :original_password, :new_password

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_length_of :password, minimum: 6, on: :create
  validate :verify_original_password, if: :changing_password
  validates_presence_of :original_password, :new_password, if: :changing_password
  validates_confirmation_of :new_password, if: :changing_password
  validates_length_of :new_password, minimum: 6, if: :changing_password

  before_create :generate_token
  before_update :change_password, if: :changing_password

  has_one :profile
  accepts_nested_attributes_for :profile

  def subscribed
    subscribed_at
  end

  def subscribed=(checkbox)
    subscribed_at = Time.zone.now if checkbox == "1"
  end

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while User.exists?(token: token)
  end

  def verify_original_password
    unless authenticate(original_password)
      errors.add :original_password, "is not correct"
    end
  end

  def change_password
    self.password = new_password
  end
end
