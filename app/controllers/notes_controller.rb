# frozen_string_literal: true

class NotesController < ApplicationController
  def index
    @notes = Note.not_completed.where(user: current_user).decorate
  end

  def show
    @note = Note.find_by(id: params[:id], user: current_user)&.decorate
    render_not_found if @note.nil?
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find_by(id: params[:id], user: current_user)
    render_not_found and return if @note.nil?

    render_completed_error if @note.completed?
  end

  def create
    @note = Note.new(note_params)

    if validate_recaptcha && @note.save
      redirect_to @note, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find_by(id: params[:id], user: current_user)
    render_not_found and return if @note.nil?

    service = Notes::Update.new(note: @note, params:)
    if validate_recaptcha && service.save
      redirect_to @note, notice: t('.success')
    else
      flash[:alert] = t('.error', errors: service.errors.full_messages.join(', '))
      render :edit, status: :unprocessable_entity
    end
  end

  def complete
    @note = Note.find_by(id: params[:id], user: current_user)
    render_not_found and return if @note.nil?
    render_completed_error and return if @note.completed?

    service = Notes::Complete.new(note: @note)
    if service.save
      respond_to do |format|
        format.html do
          flash[:notice] = t('.success')
          redirect_to @note, status: :see_other
        end
        format.turbo_stream do
          flash.now[:notice] = t('.success')
        end
      end
    else
      flash[:alert] = t('.error', errors: service.errors.full_messages.join(', '))
      redirect_to @note, status: :see_other
    end
  end

  private

  def validate_recaptcha
    return true if helpers.logged_in?

    verify_recaptcha(model: @note, action: 'note_form', minimum_score: 0.3)
  end

  def render_not_found
    @notes = Note.not_completed.where(user: current_user).decorate
    flash.now[:alert] = t('.not_found')
    render :index
  end

  def render_completed_error
    flash[:alert] = t('.completed_error')
    redirect_to @note, status: :see_other
  end

  def note_params
    params.require(:note).permit(:title, :description, :started_at, :ended_at, files: []).merge(user: current_user)
  end
end
