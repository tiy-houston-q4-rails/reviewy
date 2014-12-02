class AuthenticationsController < ApplicationController

  def create

    oauth = env["omniauth.auth"]

    user = User.where(uid: oauth["uid"]).first_or_create
    user.first_name = oauth["info"]["first_name"]
    user.last_name = oauth["info"]["last_name"]
    user.email = oauth["info"]["email"]
    user.photo_url = oauth["info"]["image"]
    user.access_token = oauth["credentials"]["token"]
    user.save!

    sign_in user
    redirect_to root_path
  end

  def destroy
    sign_out :user
    redirect_to root_path
  end
end
