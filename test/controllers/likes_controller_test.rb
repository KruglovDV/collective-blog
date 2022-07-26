# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test 'creates like' do
    sign_in(users(:first_user))
    second_post = posts(:second_post)
    post post_likes_path(second_post), params: { _method: :post }
    created_like = PostLike.find_by(post_id: second_post.id)
    assert created_like
  end

  test 'removes like' do
    sign_in(users(:first_user))
    first_post = posts(:first_post)
    first_like = post_likes(:first_like)
    post post_like_path(first_post, first_like), params: { _method: :delete }
    created_like = PostLike.find_by(post_id: first_post.id)
    assert created_like.nil?
  end
end
