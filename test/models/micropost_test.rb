require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:self)
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end
  
  test "Micropost should be valid" do
    assert @micropost.valid?
  end
  
  test "Micropost user ID should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  
  test "Micropost content should be present" do
    @micropost.content = " "
    assert_not @micropost.valid?
  end
  
  test "Micropost content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  
  test "Micropost order should be most recent first" do
    assert_equal Micropost.first, microposts(:bear)
  end
end
