class StarredItem < ApplicationRecord
  # get module to help with some functionality
  include AppHelpers::Validations

  # Relationships
  belongs_to :user
  belongs_to :item

  # Scopes
  scope :for_item,   -> (item_id) { where('item_id = ?', item_id)}
  scope :for_user,   -> (user_id) { where('user_id = ?', user_id)}

  # Validations
  validate :item_is_active_in_system
  validate :user_is_active_in_system

  # Other methods
  private
  def item_is_active_in_system
    is_active_in_system(:item)
  end

  def user_is_active_in_system
    is_active_in_system(:user)
  end

end
