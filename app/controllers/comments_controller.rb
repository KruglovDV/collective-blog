# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to post
    else
      redirect_to post, notice: comment.errors.full_messages.join(', ')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
