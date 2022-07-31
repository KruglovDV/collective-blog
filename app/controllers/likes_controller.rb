# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destory]

  def create
    post_id = params[:post_id]
    @post = Post.find(post_id)
    if @post.likes.find_by(post_id: post_id)
      redirect_to @post
    else
      @like = @post.likes.build(user: current_user)
      @like.save
      redirect_to @post
    end
  end

  def destroy
    @like = PostLike.find_by(id: params[:id])
    unless @like
      redirect_to post_path(params[:post_id])
    else
      @like.destroy
      redirect_to @like.post
    end
  end
end
