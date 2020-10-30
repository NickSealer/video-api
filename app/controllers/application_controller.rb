class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :set_user

  def set_user
    if api_v1_user_signed_in?
      @current_user = current_api_v1_user
    end
  end
end
