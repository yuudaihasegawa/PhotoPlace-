# frozen_string_literal: true

class Public::TagsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @tag = Tag.new
    @post_tag = PostTag.new
  end

  def create
    @user = User.find(params[:user_id])
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = '新しくタグを作りました'
      redirect_to new_public_user_post_path(@user)
    else
      render template: 'public/users/posts/new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :price, post_images_attributes: %i[id image_id], maps_attributes: %i[id address latitude longitude])
  end

  def tag_params
    params.require(:tag).permit(:name, :id)
  end
end
