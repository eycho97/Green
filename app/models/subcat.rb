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

  private
  def category_is_active_in_system
    is_active_in_system(:category)
  end

  # Callbacks
  before_destroy :is_destroyable?
  after_rollback :make_inactive_if_trying_to_destroy
 
  # Other methods
  attr_reader :destroyable

  #Callback methods
  def is_destroyable?
    @destroyable = self.subcat_items.empty?
    self.subcat_items.empty?
  end

  def make_inactive_if_trying_to_destroy
    if !@destroyable.nil? && @destroyable == false
      self.make_inactive
    end
    @destroyable = nil
  end

end
