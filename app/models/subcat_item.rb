class SubcatItem < ApplicationRecord
  # get module to help with some functionality
  include AppHelpers::Validations

  # Relationships
  belongs_to :subcat
  belongs_to :item

  # Scopes
  scope :for_item,   -> (item_id) { where('item_id = ?', item_id)}
  scope :for_subcat,   -> (subcat_id) { where('user_id = ?', subcat_id)}

  # Validations
  validate :item_is_active_in_system
  validate :subcat_is_active_in_system

  # Other methods
  private
  def item_is_active_in_system
    is_active_in_system(:item)
  end

  def subcat_is_active_in_system
    is_active_in_system(:subcat)
  end

end
