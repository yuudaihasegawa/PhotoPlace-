class Admin::PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿内容を変更しました'
      redirect_to admin_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @delete = @post.title
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿タイトル『 #{@delete} 』を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,:address,:latitude,:longitude,post_images_attributes:[:id,:image,:_destroy],post_tags_attributes:[:id,:tag_id,:_destroy]) 
  end

end
