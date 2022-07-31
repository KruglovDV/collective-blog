# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post_id = params[:post_id]
    @post = Post.find(post_id)

    unless @post.likes.find_by(post_id: post_id, user_id: current_user.id)
      @like = @post.likes.build(user: current_user)
      @like.save
    end
    redirect_to @post
  end

  def destroy
    @like = PostLike.find_by(id: params[:id])
    return redirect_to post_path(params[:post_id]) if @like.nil?

    @like.destroy
    redirect_to @like.post
  end
end
