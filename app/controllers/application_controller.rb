class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # redirection aprés sign_in :
  # def after_sign_in_path_for(resource)
  #   users_path
  # end

end
