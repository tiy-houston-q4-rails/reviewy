class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :trackable, :omniauthable
  has_many :authorizations

  def facebook
    token = authorizations.facebook.token
    Koala::Facebook::API.new(token)
  end

  def github
    token = authorizations.github.token
    Octokit::Client.new(access_token: token)
  end
end
