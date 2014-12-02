class AuthenticationsController < ApplicationController

  skip_before_filter :authenticate_user!

  def create

    oauth = env["omniauth.auth"]

    authorization = Authorization.find_or_initialize_by(uid: oauth["uid"], provider: params[:provider])
    authorization.token = oauth["credentials"]["token"]

    authorization.user ||= (current_user || User.new)
    authorization.user.first_name = oauth["info"]["first_name"]
    authorization.user.last_name = oauth["info"]["last_name"]
    authorization.user.email = oauth["info"]["email"]
    authorization.user.photo_url = oauth["info"]["image"]
    authorization.save! && authorization.user.save!

    sign_in authorization.user
    redirect_to root_path
  end



  def destroy
    sign_out :user
    redirect_to root_path
  end
end
