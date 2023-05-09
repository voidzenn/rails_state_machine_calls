module CallManageStatus
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm column: 'status' do
      state :init, initial: true
      state :calling, :waiting, :connected, :call_cancelled

      event :call do
        transitions from: :init, to: :calling
      end
    end
  end
end