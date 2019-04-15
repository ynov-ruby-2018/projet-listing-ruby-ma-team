class Account::MessagesController < Account::AccountController
  def index
    @user = current_user
    @messages = Message.where(user: @user)
  end
end
