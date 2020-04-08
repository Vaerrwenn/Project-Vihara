require 'test_helper'

class DepositsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deposits_index_url
    assert_response :success
  end

end
