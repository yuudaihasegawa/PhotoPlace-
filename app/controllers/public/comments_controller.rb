class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = '投稿が完了しました'
      redirect_to public_post_path(@post)
    else
      render template: "/public/posts/"
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:user_id,:content,:post_id,:_destroy) 
  end
end
