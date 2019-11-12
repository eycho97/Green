class Subcat < ApplicationRecord
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods
  include AppHelpers::Validations

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
  validate :category_is_active_in_system

  # Callbacks
  before_destroy do 
    check_if_subcat_items_empty
    if errors.present?
      @destroyable = false
      throw(:abort)
    end
  end

  # Callbacks
  after_rollback :make_inactive_if_trying_to_destroy
 
  # Other methods
  attr_reader :destroyable

  private
  def category_is_active_in_system
    is_active_in_system(:category)
  end

  #Callback methods

  def no_subcat_items?
    self.subcat_items.empty?
  end

  def check_if_subcat_items_empty
    unless no_subcat_items?
      errors.add(:base, "Subcategory cannot be deleted because it contains subcat items, but its status has been set to inactive.")
    end
  end

  def make_inactive_if_trying_to_destroy
    if !@destroyable.nil? && @destroyable == false
      self.make_inactive
    end
    @destroyable = nil
  end

end
