require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  
  def setup
    @micropost = microposts(:cat)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference "Micropost.count" do
      post :create, micropost: { content: "spy cat!" }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference "Micropost.count" do
      delete :destroy, id: @micropost
    end
    assert_redirected_to login_url
  end
end
