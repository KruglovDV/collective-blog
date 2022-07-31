# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test 'creates like' do
    user = users(:first_user)
    sign_in(user)
    second_post = posts(:second_post)
    post post_likes_path(second_post)
    created_like = PostLike.find_by(post_id: second_post.id, user_id: user.id)
    assert created_like
  end

  test 'removes like' do
    user = users(:first_user)
    sign_in(user)
    first_post = posts(:first_post)
    first_like = post_likes(:first_like)
    delete post_like_path(first_post, first_like)
    deleted_like = PostLike.find_by(id: first_like.id)
    assert deleted_like.nil?
  end
end
