class Item < ApplicationRecord
  # include AppHelpers::Activeable::InstanceMethods
  # extend AppHelpers::Activeable::ClassMethods

  # Relationships
  has_many :subcat_items
  has_many :subcats, through: :subcat_items
  has_many :starred_items
  has_many :users, through: :starred_items

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :for_category, -> (subcat) { where(category: subcat) }

  # Validations


end
