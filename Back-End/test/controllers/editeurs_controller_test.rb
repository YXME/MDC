require 'test_helper'

class EditeursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get editeurs_index_url
    assert_response :success
  end

end
