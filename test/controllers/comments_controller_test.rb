# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'creates new comment' do
    log_in(users(:first))
    new_comment = { content: 'test comment' }
    post = posts(:first)
    post post_comments_path(post), params: { post_comment: new_comment }
    created_comment = PostComment.find_by({ post_id: post.id, content: new_comment[:content] })

    assert created_comment
    assert_redirected_to post_path(post)
  end

  test 'creates nested comment' do
    log_in(users(:first))
    first_comment = post_comments(:first)
    new_comment = { content: 'test comment', parent_id: first_comment.id }
    post = posts(:first)
    post post_comments_path(post), params: { post_comment: new_comment }
    created_comment = PostComment.find_by({
                                            post_id: post.id,
                                            content: new_comment[:content]
                                          })

    assert created_comment
    assert created_comment.parent_id == first_comment.id
    assert_redirected_to post_path(post)
  end
end
