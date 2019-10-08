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
  validates :user_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :item_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validate :user_is_active_in_system
  validate :item_is_active_in_system

  private
  def user_is_active_in_system
    is_active_in_system(:user)
  end

  def item_is_active_in_system
    is_active_in_system(:item)
  end

end
