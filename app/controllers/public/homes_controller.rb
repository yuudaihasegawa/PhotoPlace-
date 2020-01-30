# frozen_string_literal: true
class Public::HomesController < ApplicationController

  def top
    # 新規投稿
    @new_posts = Post.all.order(created_at: "DESC").limit(24)
    # いいねランキング
    post_favorite_count = Post.joins(:favorites).group(:post_id).count
    post_favorited_ids = Hash[post_favorite_count.sort_by{ |_, v| -v }].keys
    @post_ranking = Post.where(id: post_favorited_ids).order(id: "DESC").limit(24)
    # タグランキング
    post_tag_count = Tag.joins(:post_tags).group(:tag_id).count
    post_tag_ids = Hash[post_tag_count.sort_by{ |_, v| -v }].keys
    @tag_ranking = Tag.where(id: post_tag_ids).limit(30)
  end



  def about; end
end
