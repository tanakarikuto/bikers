class UsersController < ApplicationController
  def new
    @user = User.new
  end 
  
  def create
    @user = User.new(user_params)
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
  
  def edit
    @user = User.find_by(params[:id])
  end
  
  def update
    #binding.pry
    @user = User.find_by(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      redirect_to ("/users/#{@user.id}"), success: "変更に成功しました"
    else
     flash.now[:danger] = "変更に失敗しました"
     render ("users/edit")
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
