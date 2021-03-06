class Account::ContactsController < Account::AccountController
  def index
    @user = current_user
    @contacts = Message.joins(:announcement).where(announcements: { user:  @user })
  end
end