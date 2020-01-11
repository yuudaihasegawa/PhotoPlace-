# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
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

  def destroy
    @user = User.find(params[:id])
    @delete = @user.name
    @user.destroy
    redirect_to admin_users_path, notice: "#{@delete}様を強制退会させました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :pocet_money, :profile_image)
  end
end
