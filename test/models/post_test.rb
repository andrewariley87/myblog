require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "a post will create with both a title and body" do
    post = Post.create(title: "New Post", body: "Body")
    assert post.persisted?
    assert_equal "New Post", post.title
    assert_equal "Body", post.body
  end

  test "a post cannot be created without a title" do
    post = Post.new(body: "Body")
    refute post.valid?
    assert post.errors.has_key?(:title)
    assert post.errors[:title].include?("can't be blank")
  end

  test "a post cannot be created without a body" do
    post = Post.new(title: "New Post")
    refute post.valid?
    assert post.errors.has_key?(:body)
    assert post.errors[:body].include?("can't be blank")
  end
end
