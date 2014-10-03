class NotesController < ApplicationController
  before_action :ensure_user_is_current, only: [:edit, :destroy]

  def index #only for user
    @notes = User.find(params[:user][:user_id]).notes
  end

  def new
    @note = current_user.notes.new
    render :new
  end

  def create
    @note = current_user.notes.new(note_params.merge(track_id: params[:track_id]))
    if @note.save
      #FLASH
      redirect_to track_url(@note.track) #can do better
    else
      flash[:errors] = @note.errors.full_messages #is this right?
      render :new
    end

  end


  def edit
  end

  def update
  end

  def destroy
    @note.destroy
    redirect_to track_url(@note.track)
  end

  private

  def ensure_user_is_current
    set_note
    render status: :forbidden, text: "That's not your note!" unless current_user == @note.user
  end

  def note_params
    params.require(:notes).permit(:user_id, :text, :track_id)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end