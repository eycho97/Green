require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  # test relationships
  should have_many(:subcats)
  
  # test "the truth" do
  #   assert true
  # end
end
