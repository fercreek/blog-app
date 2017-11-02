class PostsController < ApplicationController
  def index
    @posts = Post.order("updated_at DESC")
  end

  def show
    @post = Post.where(id: params[:id]).first
  end
end
