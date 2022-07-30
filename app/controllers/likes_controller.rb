# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destory]

  def create
    post_id = params[:post_id]
    @post = Post.find(post_id)
    if @post.likes.find_by(post_id: post_id)
      redirect_to @post, notice: t('.already_liked')
    else
      @like = @post.likes.build
      @like.user = current_user
      @like.save
      redirect_to @post
    end
  end

  def destroy
    @like = PostLike.find(params[:id])
    unless @like
      redirect_to posts_path
    else
      @like.destroy
      redirect_to @like.post
    end
  end
end
