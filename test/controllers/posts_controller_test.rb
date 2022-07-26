# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'opens posts page' do
    get root_path
    assert_response :success
  end

  test 'opens new post page' do
    sign_in(users(:first_user))
    get new_post_path
    assert_response :success
  end

  test 'creates new post' do
    sign_in(users(:first_user))
    new_post = { title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, category_id: categories(:sport).id }
    post posts_path, params: { post: new_post }
    created_post = Post.find_by(new_post)

    assert created_post
    assert_redirected_to root_path
  end

  test 'opens show post page' do
    sign_in(users(:first_user))
    get post_path(posts(:first_post))
    assert_response :success
  end
end
