class User < ApplicationRecord
  # Add roles as a constant array
  ROLES = %i[guest user admin].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Method to check user roles
  def role?(role)
    self.role == role.to_s
  end

  def admin?
    role == 'admin'
  end

  # Set default role to 'user' before creating a new user
  before_create :set_default_role

  private

  def set_default_role
    self.role ||= 'user'
  end
end
