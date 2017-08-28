class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Account successfully created!'
      redirect_to articles_path
    else
      flash.now[:error] = 'Sorry try again!'
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

 end
