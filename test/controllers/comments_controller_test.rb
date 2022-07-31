# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'creates new comment' do
    user = users(:first_user)
    sign_in(user)
    new_comment = { content: Faker::Lorem.paragraph }
    post = posts(:first_post)
    post post_comments_path(post), params: { post_comment: new_comment }
    created_comment = PostComment.find_by({ post_id: post.id, content: new_comment[:content], user_id: user.id })

    assert created_comment
    assert_redirected_to post_path(post)
  end

  test 'creates nested comment' do
    user = users(:first_user)
    sign_in(user)
    first_comment = post_comments(:first_comment)
    new_comment = { content: Faker::Lorem.paragraph, parent_id: first_comment.id }
    post = posts(:first_post)
    post post_comments_path(post), params: { post_comment: new_comment }
    created_comment = PostComment.find_by({
                                            post_id: post.id,
                                            content: new_comment[:content],
                                            user_id: user.id,
                                            ancestry: first_comment.id
                                          })

    assert created_comment
    assert_redirected_to post_path(post)
  end
end
