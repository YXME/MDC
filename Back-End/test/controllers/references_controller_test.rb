require 'test_helper'

class ReferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get references_index_url
    assert_response :success
  end

end
