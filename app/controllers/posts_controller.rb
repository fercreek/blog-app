class PostsController < ApplicationController
  def index
    @posts = Post.published.order("published_at DESC")
  end

  def show
    @post = Post.where(id: params[:id]).first
  end
end
