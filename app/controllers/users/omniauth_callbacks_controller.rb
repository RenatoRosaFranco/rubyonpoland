# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # Handles the callback for GitHub OmniAuth provider.
  def github
    callback_for(:github)
  end

  # Handles the failure scenario during OmniAuth authentication.
  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signin later.'
    redirect_to new_user_registration_url
  end

  private

  # Handles the callback from an OmniAuth provider.
  def callback_for(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if navigational_format?
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
