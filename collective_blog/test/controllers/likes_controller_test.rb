require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test 'creates like' do
    log_in(users(:first))
    first_post = posts(:first)
    post post_likes_path(first_post), params: { _method: :post }
    created_like = PostLike.find_by(post_id: first_post.id)
    assert created_like
  end

  test 'removes like' do
    log_in(users(:first))
    second_post = posts(:second)
    first_like = post_likes(:first)
    post post_like_path(second_post, first_like), params: { _method: :delete }
    created_like = PostLike.find_by(post_id: second_post.id)
    assert created_like.nil?
  end
end
