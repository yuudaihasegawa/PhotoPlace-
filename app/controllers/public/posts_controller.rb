class Public::PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @post.post_images.build
    @post.maps.build

  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = '投稿が完了しました'
      redirect_to new_public_post_tag_path(@post)
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
    params.require(:post).permit(:title,:content,:price,post_images_attributes:[:id,:image_id],maps_attributes:[:id,:address,:latitude,:longitude]) 
  end
end
