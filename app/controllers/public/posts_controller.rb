class Public::PostsController < ApplicationController

  before_action :corrent_public, only: [:create,:destroy]
  def corrent_public
    unless user_signed_in? 
      redirect_to new_user_registration_path
    end
  end

  # autocomplete :tag, :name
  PER = 1

  def index
    @posts = Post.all.includes(:favorites,:post_images)
    @posts = @posts.page(params[:page]).per(30)
    @tags = Tag.all
    # 投稿検索
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(30)
    @q.build_condition if @q.conditions.empty?
    # タグ検索
    @tag_search = Tag.ransack(params[:q])
    @tags = @tag_search.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    # コメント
    @comment = Comment.new
    @comments = @post.comments.order(id: "DESC").page(params[:page]).per(30)
    @favorites = @post.favorites.order(id: "DESC").page(params[:page]).per(30)
    # @post_tag = PostTag.where(post_id: @post.id)
    # @tag = Tag.where(id: @post_tag.tag_id)
    session[:post_id] = @post.id
  end
  
  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    @tag = Tag.new
    @post.post_images.build
    # @post.post_tags.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @tag = Tag.new
    @post = Post.new(post_params)
    @user = User.find(params[:user_id])
    @post.user_id = @user.id
    @tags = params.dig(:post,:tags_attributes)
    unless @tags.blank?
      if @post.save
        if @post.longitude.present?
          @old_tags = []
          @new_tags = []
          @tags.each do |tag|
            @tag = Tag.find_by(name: tag[1][:name])
            if @tag.nil?
              #入っていない
              @new_tag = Tag.new
              @new_tag.name = tag[1][:name]
              @new_tag.save
              #投稿に紐づける新規のタグ
              @new_tags << @new_tag
            else
              #入っている場合
              # tag[1][:name].destroy
              #投稿に紐づける既存のタグ
              @old_tags << @tag
            end
          end
          # 既存のタグと新規投稿の関連づけ
          # binding.pry
          unless @old_tags.blank?
            @old_tags.each do |old_tag|
              @post_tag = PostTag.new
              @post_tag.post_id = @post.id
              @post_tag.tag_id = old_tag.id
              @post_tag.save
            end
          end
          # 新規のタグと既存のタグの関連づけ
          unless @new_tags.blank?
            @new_tags.each do |new_tag|
              @post_tag = PostTag.new
              @post_tag.post_id = @post.id
              @post_tag.tag_id = new_tag.id
              @post_tag.save
            end
          end
          flash[:success] = '投稿が完了しました'
          redirect_to public_posts_path(@post)

        else
          @post.destroy
          flash[:success] = '住所を認識できませんでした。正しい住所を入れてください。'
          render :new
        end

      else
        render :new
      end
      
    else
    flash[:success] = '投稿につけるタグを入力してください。'
    render :new
    end
  end


  def destroy
    
  end


  private

  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,:address,:latitude,:longitude,:user_id,post_images_attributes:[:id,:image,:_destroy]) 
  end

end
