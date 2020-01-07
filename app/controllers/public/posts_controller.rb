class Public::PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    @tag = Tag.new
    @post.post_images.build
    @post.maps.build
    @post.post_tags.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = '投稿が完了しました'
      redirect_to public_posts_path(@post)
    else
      render :new
    end
  end


  def update
    
  end

  def destroy
    
  end


  private

  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,post_images_attributes:[:id,:image,:_destroy],maps_attributes:[:id,:address,:latitude,:longitude,:_destroy],post_tags_attributes:[:id,:tag_id,:_destroy]) 
  end
end
