class Item < ApplicationRecord
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods

  # Relationships
  has_many :subcat_items
  has_many :subcats, through: :subcat_items
  has_many :starred_items
  has_many :users, through: :starred_items

  # Scopes
  scope :alphabetical, -> { order(:title) }
  scope :for_category, -> (subcat) { where(category: subcat) }
  scope :featured,     -> { where(featured: true)}
  scope :needs_pic,    -> { where(picture: nil)}

  # Validations
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :link, presence: true, uniqueness: { case_sensitive: false }

  # method
  def number_of_times_starred
    return StarredItem.for_item(self).all.count
  end

end
