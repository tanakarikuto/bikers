class UsersController < ApplicationController
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params, image_name: "black-login-user.png")
    if @user.save
      #roomができたら変更
      redirect_to root_path, success: "登録しました"
    else
     flash.now[:danger] = "登録に失敗しました"
      render :new 
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(params[:id])
    if @user.save
      redirect_to root_path, success: "変更に成功しました"
    else
     flash.now[:danger] = "変更に失敗しました"
     render :update
    end
  end
  
  def edit
    @user = User.find_by(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
