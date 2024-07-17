require "test_helper"

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "votes have a story" do
    assert_equal stories(:one), votes(:three).story
  end

  test "return three latest votes" do
    10.times {stories(:one).votes.create}
    assert_equal 3,stories(:one).votes.latest.size
  end
end
