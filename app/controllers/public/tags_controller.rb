# frozen_string_literal: true
class Public::TagsController < ApplicationController

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @post_tags = PostTag.where(tag_id: @tag.id)
    @posts = []
    @post_tags.each do |post_tag|
      @posts << Post.find_by(id: post_tag.post_id)
    end
    # タグ検索
    @tag_search = Tag.ransack(params[:q])
    @tags = @tag_search.result(distinct: true)
  end

  def new
    @post = Post.find(params[:post_id])
    @tag = Tag.new
    @post_tag = PostTag.new
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :price, post_images_attributes: %i[id image_id], maps_attributes: %i[id address latitude longitude])
  end

  def tag_params
    params.require(:tag).permit(:name, :id)
  end
end
