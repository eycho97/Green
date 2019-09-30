class Category < ApplicationRecord
  # include AppHelpers::Activeable::InstanceMethods
  # extend AppHelpers::Activeable::ClassMethods
  
  # Relationships
  has_many :subcats

  # Scopes
  scope :alphabetical, -> { order(:name) }

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
end
