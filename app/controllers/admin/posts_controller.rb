class Admin::PostsController < Admin::BaseController
  def index
    @posts = scoped_posts.order("published_at DESC").page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.where(id: params[:id]).first
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      # 
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
  end

  def update
    @post = Post.where(id: params[:id]).first
    if @post.update_attributes(post_params)    
      redirect_to admin_posts_path
    else
      # 
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if @post.destroy
      redirect_to posts_path
    else
      # 
    end
  end

  private

  def scoped_posts
    if params[:status].present?
      Post.send(params[:status])
    else
      Post.all
    end
  end

  def post_params
    params.require(:post).permit(:state_event, :title, :body, :tag_ids => [])
  end
end