class SubcatItem < ApplicationRecord
  # get module to help with some functionality
  # include AppHelpers::Validations

  # Relationships
  belongs_to :subcat
  belongs_to :item

  # Scopes
  scope :for_item,   -> (item_id) { where('item_id = ?', item_id)}
  scope :for_subcat,   -> (subcat_id) { where('subcat_id = ?', subcat_id)}

  # Validations
  validates :subcat_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :item_id, presence: true, numericality: { greater_than: 0, only_integer: true }

end
