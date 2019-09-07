class StaticPagesController < ApplicationController

  def home
    unless user_signed_in?
      redirect_to about_url
    end
    
  end

  def about
  end
  
end
