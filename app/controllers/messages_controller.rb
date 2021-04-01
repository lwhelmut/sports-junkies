class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save

    # SendMessageJob.perform_later(@message.user_id)

  end

  def update
    respond_to do |format|
      if @message.update
        format.html{redirect_to @message, notice: "Message was successfully updated"}
        format.json{render :show, status: :ok, location: @message }
      else
        format.html{render :edit}
        format.json{render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :image, :user_id, :room_id)
  end
    
end
