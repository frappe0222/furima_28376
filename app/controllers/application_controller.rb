class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:name_family,:name_first,:kana_name_family,:kana_name_first,:bath ])
  end

  def create
    @post_image = PostImage.new
    @post_image.id = current_user.id
    @post_image.save  
 end
 
end
