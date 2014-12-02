class PageController < ApplicationController



  def public
    @tacos = Taco.all
  end

  def private
    @repos = current_user.github.repos
  end
end
