class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def show
    @nickname = current_user.nickname
  end
  
  def create
    if current_user.create(user_params)
      redirect_to root_path
    else
      render :create
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:name_family,:name_first,:kana_name_family,:kana_name_first,:bath,:pass )
  end

end