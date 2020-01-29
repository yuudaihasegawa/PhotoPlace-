class Public::MapsController < ApplicationController


  before_action :corrent_public, only: [:index]
  def corrent_public
    unless user_signed_in? 
      redirect_to new_user_registration_path
    end
  end

  def index
    @posts = Post.all.includes(:favorites,:post_images)
    # @q = Post.ransack(params[:q])
    # @posts = @q.result(distinct: true)
    # @q.build_condition if @q.conditions.empty?
  end



  private

  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,:address,:latitude,:longitude,:user_id,post_images_attributes:[:id,:image,:_destroy],post_tags_attributes:[:id,:tag_id,:_destroy]) 
  end

end
