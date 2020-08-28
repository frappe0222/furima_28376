class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:name_family,:name_first,:kana_name_family,:kana_name_first,:birth ])
  end

  def create
    @post_image = PostImage.new
    @post_image.id = current_user.id
    @post_image.save  
  end

 private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_FURIMA_USER"] && password == ENV["BASIC_FURIMA_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
