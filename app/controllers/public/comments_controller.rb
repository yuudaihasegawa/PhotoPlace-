class Public::CommentsController < ApplicationController

  def create
    @post = Post.find(session[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.valid?
      @comment.save#大丈夫そうだったら保存
      @comments = []#空配列を定義
      @comments << @comment #@commentsに今作った@commentをpush・・・comment_lists.html.erbで使う
      flash[:success] = '投稿が完了しました'
      render :comment_index#(アクションは必要ない（このファイルのjs.erbファイルを作る）)
      
    else
      render template: "/public/posts/show"
    end
  end

  def new
    @comment = Comment.new
  end



  private

  def comment_params
    params.require(:comment).permit(:user_id,:content,:post_id,:_destroy) 
  end
end
