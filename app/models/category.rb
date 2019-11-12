class Category < ApplicationRecord
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods
  
  # Relationships
  has_many :subcats

  # Scopes
  scope :alphabetical, -> { order(:name) }

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # Callbacks
  before_destroy do 
    check_if_subcats_empty
    if errors.present?
      @destroyable = false
      throw(:abort)
    end
  end
  
  after_rollback :make_inactive_if_trying_to_destroy
 
  # Other methods
  attr_reader :destroyable
  
  private
  def check_if_subcats_empty
    unless no_subcats?
      errors.add(:base, "Category cannot be deleted because it contains sub-categories, but its status has been set to inactive.")
    end
  end

  def no_subcats?
    self.subcats.empty?
  end

  def make_inactive_if_trying_to_destroy
    if !@destroyable.nil? && @destroyable == false
      self.subcats.each{ |subcat| subcat.make_inactive }
      self.make_inactive
    end
    @destroyable = nil
  end

end
