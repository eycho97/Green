class SubcatItem < ApplicationRecord
  # get module to help with some functionality
  include AppHelpers::Validations

  # Relationships
  belongs_to :subcat
  belongs_to :item

  # Scopes
  scope :for_item,   -> (item_id) { where('item_id = ?', item_id)}
  scope :for_subcat,   -> (subcat_id) { where('subcat_id = ?', subcat_id)}

  # Validations
  validates :subcat_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :item_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validate :subcat_is_active_in_system
  validate :item_is_active_in_system

  private
  def subcat_is_active_in_system
    is_active_in_system(:subcat)
  end

  def item_is_active_in_system
    is_active_in_system(:item)
  end

end
