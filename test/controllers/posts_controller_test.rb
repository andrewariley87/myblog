require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  setup do
    @post = posts(:post_one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { title: "Title", body: "Body" }
    end
    assert_redirected_to posts_path
  end

  test "should render new if post is not created" do
    assert_no_difference('Post.count') do
      post :create, post: { title: "Title" }
    end
    assert_template :new
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { title: "New Title" }
    post = assigns(:post)
    assert_equal "New Title", post.title
    assert_redirected_to posts_path
  end

  test "post will not update if title is nil" do
    assert_equal "Post One", @post.title
    patch :update, id: @post, post: { title: nil }
    post = assigns(:post)
    post.reload
    assert_equal "Post One", post.title
    assert_template :edit
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
