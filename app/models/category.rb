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
  before_destroy :is_destroyable?
  after_rollback :make_inactive_if_trying_to_destroy
 
  # Other methods
  attr_reader :destroyable
  
  private
  def is_destroyable?
    @destroyable = self.subcats.empty?
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
