class PostsController < ApplicationController
  def index
   @posts = @post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = posts.new (content: params[:content])
     if @post.save
       redirect_to request.referer, success: 'ポストに成功しました' #←同じページにリダイレクト
     else
         flash.now[:danger] = "ポストに失敗しました"
     end
  end
end
