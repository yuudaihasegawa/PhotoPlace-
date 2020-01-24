class Admin::PostsController < ApplicationController

  before_action :authenticate_admin! 

  def index
    @posts = Post.all
    @tags = Tag.all
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
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
