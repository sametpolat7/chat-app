class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "No authorization. Check your membership in the Profile tab."
    redirect_to(root_path)
  end
end
