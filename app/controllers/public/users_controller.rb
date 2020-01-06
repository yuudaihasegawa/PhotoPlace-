class Public::UsersController < ApplicationController


  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user), notice: "プロフィールを更新しました。"
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
      flash.now[:public] = "入力情報が一致しませんでした。"
      render template: "public/users/confile"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,:introduction,:pocet_money) 
  end

end
