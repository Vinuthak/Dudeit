require "test_helper"

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "is not valid without a name" do
    s = Story.create(
      name: nil,
      link: "http://testWithoutLink.com"
    )
    assert s.errors[:name].any?
    refute s.valid?

  end

  test "is not valid without a link" do
    s = Story.create(
      name: "Test",
      link: nil
    )
    assert s.errors[:link].any?
    refute s.valid?

  end 

  test "is not valid without a name and link" do
    s = Story.create(
      name: nil,
      link: nil
    )
    assert s.errors.any?
    refute s.valid?
  end

  test "is valid with required attributes" do
    s = Story.create(
      name: "Test",
      link: "https://TestSubmission.com"
    )
    assert s.valid?
    refute s.errors.any?
  end

end
