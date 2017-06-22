class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.password != user.password_confirmation
      redirect_to '/new'
    elsif user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
