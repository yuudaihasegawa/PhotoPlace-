# frozen_string_literal: true
class Admin::PostsController < ApplicationController
  
  before_action :corrent_admin, only: [:index,:show,:destroy]
  def corrent_admin
    unless admin_signed_in? 
      redirect_to public_homes_top_path
    end
  end

  def index
    @posts = Post.all
    @posts = @posts.page(params[:page]).per(30)
    @tags = Tag.all
    # 投稿検索
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    @q.build_condition if @q.conditions.empty?
    # タグ検索
    @tag_search = Tag.ransack(params[:q])
    @tags = @tag_search.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(id: "DESC").page(params[:page]).per(30)
    @favorites = @post.favorites.order(id: "DESC").page(params[:page]).per(30)
  end

  def destroy
    @post = Post.find(params[:id])
    @delete = @post.title
    @post.destroy
    redirect_to admin_posts_path, notice: "投稿タイトル『 #{@delete} 』を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :price, :_destroy, :address, :latitude, :longitude, post_images_attributes: %i[id image _destroy], post_tags_attributes: %i[id tag_id _destroy])
  end
end
