# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'opens posts page' do
    get root_path
    assert_response :success
  end

  test 'opens new post page' do
    log_in(users(:first))
    get new_post_path
    assert_response :success
  end

  test 'creates new post' do
    log_in(users(:first))
    new_post = { title: 'test title', body: 'test body', category_id: categories(:sport).id }
    post posts_path, params: { post: new_post }
    created_post = Post.find_by(new_post)

    assert created_post
    assert_redirected_to root_path
  end
end
