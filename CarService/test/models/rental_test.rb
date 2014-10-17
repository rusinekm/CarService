require 'test_helper'

class RentalTest < ActiveSupport::TestCase
  test 'Create rental' do
    assert_difference("Rental.count", 1) do
    Rental.create()
  end

end
