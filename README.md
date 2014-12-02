Reviewy
=======


### How to Sign in via Facebook

1. create a local app, https://developers.facebook.com/
1. Add a new app, named “Reviewy DEV”, choose website
1. Choose test or not, we did “not test"
1. enter “http://localhost:3000” for website
1. get “App ID” and “App Secret"
1. on config/initializers/devise.rb, add following:

```ruby
config.omniauth :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"]
```

on app/models/user.rb, add `:omniauthable`

Add to gemfile:

```ruby
  gem 'omniauth'
  gem 'omniauth-facebook'
```

6. Added a route, and a new controller:

```
get 'users/auth/:provider/callback' => 'authentications#create'

class AuthenticationsController < ApplicationController
  def create
    render text: "YOLO"
  end
end
```

6. Make user.rb look like so:

```
class User < ActiveRecord::Base
  devise  :trackable, :omniauthable
end
```

7. draw the rest of the fucking owl

```ruby
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
```

