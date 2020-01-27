class Admin::UsersController < ApplicationController

  before_action :corrent_admin, only: [:index,:show,:edit,:update,:destroy]
  def corrent_admin
    unless admin_signed_in? 
      redirect_to public_homes_top_path
    end
  end

  def index
    @user = User.all.page(params[:page]).per(50)
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true).page(params[:page]).per(50)
    @q.build_condition if @q.conditions.empty?
  end

  def show
    @user = User.find(params[:id])
    @favorite = Favorite.where(user_id: @user.id)
    @posts = []
    @favorite.each do |favo|
      @posts << Post.where(id: favo.post_id).includes(:post_images)
    end
    @posts.flatten!
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィールを変更しました'
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @delete = @user.name
    @user.destroy
    redirect_to admin_users_path, notice: "#{@delete}様を強制退会させました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,:introduction,:pocet_money,:profile_image) 
  end
end
