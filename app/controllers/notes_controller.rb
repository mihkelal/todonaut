class NotesController < ApplicationController
  def index
    @notes = Note.not_ended.not_completed.decorate
  end

  def show
    @note = Note.find(params[:id]).decorate
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: 'Note successfully created.'
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to @note, notice: 'Note successfully updated.'
    else
      render :edit
    end
  end

  def complete
    @note = Note.find(params[:id])
    service = Notes::Complete.new(note: @note)
    if service.save
      flash[:notice] = 'Note successfully marked as completed.'
    else
      flash[:alert] = "Note not marked as completed: #{service.errors.full_messages.join(', ')}"
    end
    redirect_to @note
  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :started_at, :ended_at)
  end
end
