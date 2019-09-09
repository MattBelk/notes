class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @user = current_user
      @unpinned_notes = @user.notes.unpinned
      @pinned_notes = @user.notes.pinned
      @new_note = @user.notes.build
    else
      redirect_to about_url
    end
  end

  def about
  end
  
end
