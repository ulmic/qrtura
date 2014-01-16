require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = create :page
  end

  test "should get show" do
    get :show, id: @page
    assert_response :success
  end
end
