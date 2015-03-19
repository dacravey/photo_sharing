class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thank you for making an account, we promise to send an e-mail within the next 87 days"
      redirect_to "/"
    else
      flash[:notice] = "There was a problem creating your account. Please try again"
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)

  end
end
