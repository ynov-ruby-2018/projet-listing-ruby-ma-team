class Account::MessagesController < AccountController
  def index
    @user = current_user
    @messages = Message.where(user: @user)
  end
end
