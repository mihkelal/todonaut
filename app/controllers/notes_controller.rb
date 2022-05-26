class NotesController < ApplicationController
  def index def
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

    if validate_recaptcha && @note.save
      redirect_to @note, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @note = Note.find(params[:id])
    authorize(@note)
  end

  def update
    @note = Note.find(params[:id])
    authorize(@note)

    if validate_recaptcha && @note.update(note_params)
      redirect_to @note, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def complete
    @note = Note.find(params[:id])
    authorize(@note)

    service = Notes::Complete.new(note: @note)
    if service.save
      flash[:notice] = t('.success')
      redirect_to notes_path, status: :see_other
    else
      flash[:alert] = t('.error', errors: service.errors.full_messages.join(', '))
      2
      redirect_to @note, status: :see_other
    end
  end

  private

  def validate_recaptcha
    return true if helpers.logged_in?

    verify_recaptcha(model: @note)
  end

  def note_params
    params.require(:note).permit(:title, :description, :started_at, :ended_at, files: []).merge(user: current_user)
  end
end
