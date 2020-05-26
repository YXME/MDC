require 'test_helper'

class LicencersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get licencers_index_url
    assert_response :success
  end

end
