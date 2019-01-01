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

  private

  def before_validation
  end

  def perform
  end
end
