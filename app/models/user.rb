class User < ApplicationRecord
  # include AppHelpers::Activeable::InstanceMethods
  # extend AppHelpers::Activeable::ClassMethods

  # use has_secure_password
  has_secure_password

  # For use in authorizing with CanCan
  ROLES = [['Administrator', :admin],['Manager', :manager],['Customer',:customer]]

  #Relationships
  has_many :starred_items
  has_many :items, through: :starred_items

  # Scopes
  scope :alphabetical,  -> { order(:last_name).order(:first_name) }
  scope :employees,     -> { where.not(role: 'customer') }
  scope :customers,     -> { where(role: 'customer') }

  # Validations
  validates_presence_of :first_name, :last_name
  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
  validates :role, inclusion: { in: %w[admin manager customer], message: "is not a recognized role in system" }
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

end