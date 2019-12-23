require 'test_helper'

class StaticBlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get blog" do
    get static_blogs_blog_url
    assert_response :success
  end

end
