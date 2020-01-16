class Public::MapsController < ApplicationController

  def index
    @posts = Post.all
  end

  def map
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,:address,:latitude,:longitude,:user_id,post_images_attributes:[:id,:image,:_destroy],post_tags_attributes:[:id,:tag_id,:_destroy]) 
  end

end
