# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post.likes.find_or_create_by(user_id: current_user.id)
    redirect_to @post
  end

  def destroy
    @like = PostLike.find_by(id: params[:id])
    return redirect_to post_path(params[:post_id]) if @like.nil?

    @like.destroy
    redirect_to @like.post
  end
end
