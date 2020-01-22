class Public::TagsController < ApplicationController

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @post_tags = PostTag.where(tag_id: @tag.id)
    @posts = []
    @post_tags.each do |post_tag|
      @posts << Post.find_by(id: post_tag.post_id)
    end
  end


  def new
    @post = Post.find(params[:post_id])
    @tag= Tag.new
    @post_tag = PostTag.new
  end

  def create
    @user = User.find(params[:user_id])
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = '新しくタグを作りました'
      redirect_to new_public_user_post_path(@user)
    else
      render template: "public/users/posts/new"
    end

  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:price,post_images_attributes:[:id,:image_id],maps_attributes:[:id,:address,:latitude,:longitude]) 
  end

  def tag_params
    params.require(:tag).permit(:name,:id) 
  end
end
