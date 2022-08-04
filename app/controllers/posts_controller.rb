# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]

  def index
    @posts = Post.all.includes(:creator).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    @like = current_user.likes.find_by(post_id: @post.id) if current_user
    @newComment = @post.comments.build
    @comments = @post.comments.arrange
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
