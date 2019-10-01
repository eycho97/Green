class StarredItem < ApplicationRecord
  # get module to help with some functionality
  # include AppHelpers::Validations

  # Relationships
  belongs_to :user
  belongs_to :item

  # Scopes
  scope :for_item,   -> (item_id) { where('item_id = ?', item_id)}
  scope :for_user,   -> (user_id) { where('user_id = ?', user_id)}

  # Validations
  validates :user_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :item_id, presence: true, numericality: { greater_than: 0, only_integer: true }

end
