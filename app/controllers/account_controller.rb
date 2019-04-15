class AccountController < ApplicationController
  def profile
    @user = current_user

  end
  def contacts

  end
  def messages
    @user = current_user
    @messages = Message.where(user: @user)
  end

  before_action :authenticate_user!


  def update_user
    @user = current_user
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      render "profile"
    end
  end

  def update_password
    @user = current_user
    if @user.update(user_password_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "profile"
    end
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
