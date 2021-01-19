class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)

    if message.save
      # the second argument is received in chatroom.coffee script
      ActionCable.server.broadcast "chatroom_channel", msg: message_render(message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    # render partial message. the partial requires a message object, send message in that message object
    render(partial: 'message', locals: {message: message})
  end
end
