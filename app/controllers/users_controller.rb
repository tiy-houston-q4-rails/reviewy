class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      sign_in @user # Tell devise to sign in a user.

      WelcomeMailer.signup(@user).deliver # send the email

      redirect_to root_path, message: "BOOM"
    else
      render :new
    end
  end
end
