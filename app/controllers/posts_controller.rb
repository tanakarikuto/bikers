class PostsController < ApplicationController
  
  def create
    @post = Post.new(content: params[:content], room_id: params[:room_id], user_id: current_user.id)
     if @post.save
       redirect_to request.referer, success: 'ポストに成功しました' #←同じページにリダイレクト
     else
         flash.now[:danger] = "ポストに失敗しました"
         @rooms = Room.all
         @room = Room.find(params[:room_id])
         render "rooms/show"
     end
  end
end
