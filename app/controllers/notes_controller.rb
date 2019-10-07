# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = policy_scope(Note.with_attached_files).decorate
  end

  def show
    @note = Note.find(params[:id]).decorate
    authorize(@note)
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
    authorize(@note)
  end

  def update
    @note = Note.find(params[:id])
    authorize(@note)

    if @note.update(note_params)
      redirect_to @note, notice: 'Note successfully updated.'
    else
      render :edit
    end
  end

  def complete
    @note = Note.find(params[:id])
    authorize(@note)

    service = Notes::Complete.new(note: @note)
    if service.save
      flash[:notice] = 'Note successfully marked as completed.'
      redirect_to notes_path
    else
      flash[:alert] = "Note not marked as completed: #{service.errors.full_messages.join(', ')}"
      redirect_to @note
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :started_at, :ended_at, files: []).merge(user: current_user)
  end
end
