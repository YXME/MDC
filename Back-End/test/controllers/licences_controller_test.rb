require 'test_helper'

class LicencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get licences_index_url
    assert_response :success
  end

end
