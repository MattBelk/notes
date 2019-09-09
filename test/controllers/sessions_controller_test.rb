require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @first_user = create(:user)
    @second_user = create(:user)
  end

  test "create should reset first user's notes" do
  end

  test "destroy should reset first user's notes" do
  end

end
