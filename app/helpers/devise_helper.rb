module DeviseHelper
  def devise_error_messages!
    if resource.errors.full_messages.first
      flash.now[:alert] = resource.errors.full_messages.first
    end
  end
end