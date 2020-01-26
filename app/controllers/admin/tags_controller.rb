class Admin::TagsController < ApplicationController

  before_action :corrent_admin, only: [:show]
  def corrent_admin
    unless admin_signed_in? 
      redirect_to public_homes_top_path
    end
  end

  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @post_tags = PostTag.where(tag_id: @tag.id)
    @posts = []
    @post_tags.each do |post_tag|
      @posts << Post.find_by(id: post_tag.post_id)
    end
    # タグ検索
      @tag_search = Tag.ransack(params[:tag_search])
      @tags = @tag_search.result(distinct: true)

  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_posts_path
  end

end
