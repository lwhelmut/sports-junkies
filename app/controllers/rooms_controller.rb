class RoomsController < ApplicationController

  def new
    @room = Room.new
  end
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to root_path
    end
  end

  private
  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

end
