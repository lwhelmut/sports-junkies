class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    end
    
end
