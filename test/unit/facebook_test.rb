require 'test_helper'

class FacebookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "validates_format_of with allow_blank" do
    assert_nothing_raised do
      Facebook.create!
    end
  end
end
