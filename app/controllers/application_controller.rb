class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :first_name, :last_name, :read_first_name, :read_last_name])
  end

end
