# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destory]

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user = current_user
    @like.save
    redirect_to @post
  end

  def destroy
    @like = PostLike.find(params[:id])
    @like.destroy
    redirect_to @like.post
  end
end
