class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private
  def post_params
    params, require(:post).permit(:description)
  end
end
