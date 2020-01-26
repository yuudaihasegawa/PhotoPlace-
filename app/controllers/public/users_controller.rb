class Public::UsersController < ApplicationController
  
  before_action :corrent_public, only: [:show,:edit,:confile,:create,:destroy]
  def corrent_public
    unless user_signed_in? 
      redirect_to new_user_registration_path
    end
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
      redirect_to public_user_path(@user)
    else
      render :edit
    end
  end

  def confile
    @user = User.find(params[:user_id])
  end

  def destroy
    @user = User.find_by_email(params[:user][:email])
    if @user.valid_password?(params[:user][:password])
      @user.destroy
      redirect_to new_user_registration_path, notice: "退会しました。ご利用ありがとうございました。"
    else
      flash[:public] = "入力情報が一致しませんでした。"
      render template: "public/users/confile"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,:introduction,:pocet_money,:profile_image) 
  end

end
