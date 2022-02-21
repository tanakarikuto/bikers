class CommentsController < ApplicationController
 
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to request.referer, success: 'コメントを追加しました'
    else
      flash.now[:danger] = "コメントが追加できませんでした"
      @rooms = Room.all
      @room = Room.find(params[:room_id])
      render "rooms/show"
    end
    
  end
  
  private
  def comment_params
    params.permit(:content, :room_id, :post_id, :user_id)
  end
  
end
