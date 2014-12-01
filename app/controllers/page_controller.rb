class PageController < ApplicationController

  before_action :authenticate_user!, only: [:private]

  def public
    @tacos = Taco.all
  end

  def private
  end
end
