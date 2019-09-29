require 'test_helper'

class StarredItemTest < ActiveSupport::TestCase

  # test relationships
  should belong_to(:user)
  should belong_to(:item)

  # test "the truth" do
  #   assert true
  # end
end
