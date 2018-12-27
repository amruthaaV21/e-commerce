class StaticPagesController < ApplicationController
  def home
   @product = current_user.products.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end

  def new
  end

end
