class CallsController < ApplicationController
  def call
    # Transitions from :init to :calling state
    data = Call.take
    data.call!
  end
end
