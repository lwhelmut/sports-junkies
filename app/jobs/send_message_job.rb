class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(data)
    mine = ApplicationController.render(
      partial: 'messages/mine', 
      locals: {messsage: message}
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs', 
      locals: {messsage: message}
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}", mine: mine, theirs: theirs, message: message
  end
end
