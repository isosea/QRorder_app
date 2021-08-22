require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tables_new_url
    assert_response :success
  end

end
