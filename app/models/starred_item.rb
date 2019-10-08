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
  validate :item_is_not_already_starred
  validate :user_is_active_in_system
  validate :item_is_active_in_system

  private
  # Custom Validations
  def item_is_not_already_starred
    return true if self.item.nil? || self.user.nil?
    unless StarredItem.where(item_id: self.item_id, user_id: self.user_id).to_a.empty?
      errors.add(:base, "You have already starred this item")
    end
  end

  def user_is_active_in_system
    is_active_in_system(:user)
  end

  def item_is_active_in_system
    is_active_in_system(:item)
  end

end
