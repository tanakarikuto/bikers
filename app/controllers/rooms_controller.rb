class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def show
    @rooms = Room.all
    @room = Room.find(params[:id])
  end
  
end