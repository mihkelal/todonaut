# frozen_string_literal: true

class ApplicationService
  include ActiveModel::Model

  def save
    save!
  rescue ActiveRecord::RecordInvalid
    errors.add(:base, :unknown) if errors.empty?
    false
  end

  def save!
    before_validation
    raise(ActiveRecord::RecordInvalid, self) unless valid?

    ApplicationRecord.transaction { perform }
  end

  def perform
  end

  private

  def before_validation
  end

  def add_errors_and_raise!(entity)
    errors.merge!(entity.errors)
    raise ActiveRecord::RecordInvalid, self
  end
end
