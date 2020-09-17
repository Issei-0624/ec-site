class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
      root_path
  end
  
    private

  def require_user_singed_in
    unless signed_in?
      redirect_to root_url
    end
  end
end
