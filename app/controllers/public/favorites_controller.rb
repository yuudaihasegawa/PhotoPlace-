class Public::FavoritesController < ApplicationController

  before_action :corrent_public, only: [:create,:destroy]
  def corrent_public
    unless user_signed_in? 
      redirect_to new_user_registration_path
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.new(post_id: @post.id)
    @favorite.save
    redirect_to public_post_path(@post)
  end 

  def destroy
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    redirect_to public_post_path(@post)
  end
end
