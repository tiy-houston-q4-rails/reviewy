class PageController < ApplicationController

  

  def public
    @tacos = Taco.all
  end

  def private
  end
end
