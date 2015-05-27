require 'test_helper'

class GigTest < ActiveSupport::TestCase
  test "requireGigFields" do
    gig = Gig.new
    assert_not gig.save
  end

  test "allGigs" do
    assert_equal 20, Gig.count
  end

end
