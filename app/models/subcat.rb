class Subcat < ApplicationRecord
  # include AppHelpers::Activeable::InstanceMethods
  # extend AppHelpers::Activeable::ClassMethods

  # Relationships
  belongs_to :category
  has_many :subcat_items
  has_many :items, through: :subcat_items

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :for_category, -> (category_id) { where("category_id = ?", category_id) }

  # Validations
  validates_presence_of :category_id
  validates :name, presence: true, uniqueness: { case_sensitive: false }


end
