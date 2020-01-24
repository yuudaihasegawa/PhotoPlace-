class Admin::MapsController < ApplicationController

  before_action :corrent_admin, only: [:index]
  def corrent_admin
    unless admin_signed_in? 
      redirect_to public_homes_top_path
    end
  end

  def index
    @posts = Post.all.includes(:favorites,:post_images)
  end

  private
  
  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,:address,:latitude,:longitude,:user_id,post_images_attributes:[:id,:image,:_destroy],post_tags_attributes:[:id,:tag_id,:_destroy]) 
  end
end
