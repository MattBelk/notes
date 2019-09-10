class PinsController < ApplicationController
  before_action :authenticate_user!
  # Method in ApplicationController to check the user owns the note
  before_action :correct_note_user

  def create
    @user = current_user
    @note = @user.notes.find(params[:id])
    @user.pin(@note)
    @note.insert_at(@user.notes.pinned.count)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def destroy
    @user = current_user
    @note = @user.notes.find(params[:id])
    @user.unpin(@note)
    @note.insert_at(@user.notes.pinned.count + 1)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

end
