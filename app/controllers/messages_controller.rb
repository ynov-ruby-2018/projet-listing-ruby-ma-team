class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def create
    if(message_params['content'] == nil || message_params['content'] == '')
      flash[:alert] = t('message.failure')

    else
      @message = Message.new(message_params)
      @message.user = current_user
      @message.save!

      DefaultMailer.with(message: @message).notify_message.deliver_now

      # flash[:notice] = t('message.success')
    end
    redirect_to announcements_path
  end

  def message_params
    params.require(:message).permit(:content, :announcement_id)
  end
end
