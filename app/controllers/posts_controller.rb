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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content
  end
end
