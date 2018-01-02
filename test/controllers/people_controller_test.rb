require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get import" do
    get people_import_url
    assert_response :success
  end

end
