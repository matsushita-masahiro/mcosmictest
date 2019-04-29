require 'test_helper'

class UserTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_types_edit_url
    assert_response :success
  end

end
