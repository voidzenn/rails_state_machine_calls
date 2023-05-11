module CallManageStatus
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'status' do
      state :init, initial: true
      state :calling, :waiting, :answered, :connected, :call_cancelled

      event :call do
        transitions from: :init, to: :calling
      end

      event :wait do
        transitions from: :calling, to: :waiting
      end

      event :answer do
        transitions from: :waiting, to: :answered
      end

      event :connect do
        transitions from: :answered, to: :connected
      end

      event :cancel_call do
        transitions from: %i(calling answered waiting connected), to: :call_cancelled
      end
    end
  end
end