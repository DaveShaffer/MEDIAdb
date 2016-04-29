class StaticPagesController < ApplicationController
  def home
    redirect_to dvds_path if signed_in?
  end # End def home

  def about
  end # End def about
end # End Class StaticPagesController
