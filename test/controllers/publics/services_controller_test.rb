require 'test_helper'

class Publics::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_services_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_services_show_url
    assert_response :success
  end

  test "should get update" do
    get publics_services_update_url
    assert_response :success
  end

end
