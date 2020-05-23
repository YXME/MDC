require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get accueil" do
    get page_accueil_url
    assert_response :success
  end

end
