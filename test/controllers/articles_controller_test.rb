require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get blog" do
    get articles_blog_url
    assert_response :success
  end

  test "should get show" do
    get articles_show_url
    assert_response :success
  end

end
