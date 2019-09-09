class NotesController < ApplicationController
  before_action :authenticate_user!
  # Method in ApplicationController to check the user owns the note
  before_action :correct_note_user, except: [:create]

  def create
    @user = current_user
    @note = @user.notes.build(note_params)

    if @note.save()
      @new_note = @user.notes.build
      @note.insert_at(1 + @user.notes.pinned.count)
      respond_to do |format|
        format.html do
          flash[:notice] = "Note Created"
          redirect_to root_url
        end
        format.js do
          flash.now[:notice] = "Note Created"
          @unpinned_count = Note.unpinned.count
          @pinned_count = Note.pinned.count
        end
      end
    else
      flash[:alert] = "Note not created"
      redirect_to root_url
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update_attributes(note_params)
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      flash[:alert] = "Note not updated"
      redirect_to root_url
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.remove_from_list
    @pinned = @note.pinned?
    @note.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def sort
    note = current_user.notes.find(params[:id].to_i)
    if note.pinned?
      note.insert_at(params[:position].to_i)
    else
      note.insert_at(params[:position].to_i + Note.pinned.count)
    end
    head :ok
  end

  private

  # Update title and body through #update, position through #sort.
  # Note: the pinned attribute is updated through the PinsController.
  def note_params
    params.require(:note).permit(:title, :body, :position)
  end


end
