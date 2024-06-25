require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stories_url
    assert_response :success
  end

  test "should get new" do
    get new_story_url
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:story)
  end

  test "new shows new form" do
    get new_story_path
    assert_select 'form div',count:2
  end

  test "adds a story" do
    assert_difference 'Story.count' do
      post stories_path, params:{
        story:{
          name: 'Test Blog',
          link: 'https://Testblog.com'
        }
      }
      assert_redirected_to stories_path
      assert_not_nil flash[:notice]
    end
  end

  test "rejects when story missing link attribute" do
    assert_no_difference 'Story.count' do
      post stories_path,params:{
        story:{
          name: "Test Blog without link",
          link: nil
        }
      }
    end
  end

  test "rejects when story missing name attribute" do
    assert_no_difference 'Story.count' do
      post stories_path,params:{
        story:{
          link: 'https://testblog.com'
        }
      }
    end
  end
end
