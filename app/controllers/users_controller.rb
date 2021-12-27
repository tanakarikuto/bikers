class UsersController < ApplicationController
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to ("rooms/index"), flash = "登録に成功しました！"
    else
      flash = "登録に失敗しました、、、"
      render :new 
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
