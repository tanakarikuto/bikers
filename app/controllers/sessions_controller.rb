class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #ルームができたら変更
      redirect_to rooms_path
    else
      flash.now[:danger]= "ログインに失敗しました、、、"
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
