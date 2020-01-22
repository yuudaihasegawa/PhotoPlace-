class Public::PostsController < ApplicationController

  # autocomplete :tag, :name

  def index
    @posts = Post.all.includes(:favorites,:post_images)
    @tags = Tag.all
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    # @post_tag = PostTag.where(post_id: @post.id)
    # @tag = Tag.where(id: @post_tag.tag_id)
    @comment = Comment.new
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
    @old_tags = []
    @new_tags = []
    @tags.each do |tag|
      @tag = Tag.find_by(name: tag[1][:name])
          binding.pry
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
    if @post.save
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
      render :new
    end
  end


  def update

  end

  def destroy
    
  end


  private

  def post_params
    params.require(:post).permit(:title,:content,:price,:_destroy,:address,:latitude,:longitude,:user_id,post_images_attributes:[:id,:image,:_destroy]) 
  end

end
