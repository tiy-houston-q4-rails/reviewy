class WelcomeMailer < ActionMailer::Base
  default from: "robot@yourcoolapp.io"


  def signup(user)
    @user = user

    mail to: user.email, subject: "Thanks for signing up, #{user.email}"
  end
end
