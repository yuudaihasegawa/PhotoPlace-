class Public::PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
  end
  
  def new
    @post = Post.new
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def post_params

  end
end
