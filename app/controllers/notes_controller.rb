class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy complete]

  def index
    @notes = Note.all.decorate
  end

  def show
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
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: 'Note successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_url, notice: 'Note successfully destroyed.'
  end

  def complete
    service = Notes::Complete.new(note: @note)
    if service.save
      flash[:notice] = 'Note successfully marked as completed.'
    else
      flash[:alert] = "Note not marked as completed: #{service.errors.full_messages.join(', ')}"
    end
    redirect_to @note
  end

  private

  def set_note
    @note = Note.find(params[:id]).decorate
  end

  def note_params
    params.require(:note).permit(:title, :description, :started_at, :ended_at)
  end
end