class Account::ProfileController < Account::AccountController
  def index
    @user = current_user
  end

  def update_user
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      flash[:notice] = t('devise.registrations.updated')
      redirect_to action: "index"
    end
  end


  def update_password
    @user = current_user
    if @user.update(user_password_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
    else
      flash[:notice] = t('devise.passwords.updated_not_active')
    end
    redirect_to action: "index"
  end

  private

  def user_params
    params.require(:user).permit(:lastname, :firstname, :email)
  end

  def user_password_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end
