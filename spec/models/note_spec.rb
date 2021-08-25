# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Note do
  describe '#completed?' do
    subject { note.completed? }

    context 'with nil completed_at' do
      let(:note) { build_stubbed(:note, completed_at: nil) }

      it { is_expected.to be_falsey }
    end

    context 'with completed_at in future' do
      let(:note) { build_stubbed(:note, completed_at: 1.minute.from_now) }

      it { is_expected.to be_falsey }
    end

    context 'with completed_at in past' do
      let(:note) { build_stubbed(:note, completed_at: 1.minute.ago) }

      it { is_expected.to be_truthy }
    end
  end
end
