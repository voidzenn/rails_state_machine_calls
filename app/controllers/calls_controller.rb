class CallsController < ApplicationController
  attr_reader :status, :has_data

  def initialize
    @status = current_call_status
    @has_data = call_data_exists?
  end

  def initialize_call
    current_call.update status: "init"
  end

  def change_status
    handle_state
  end

  def cancel_call
    reject_call
  end

  private
  def current_status
    return nil if !call_data_exists?

    c = Call.take
    { call: c, status: c[:status] }
  end

  def current_call
    @current_call = current_status[:call]
  end

  def current_call_status
    @current_call_status = current_status[:status]
  end

  def call_data_exists?
    @call_data_exists = Call.exists?
  end

  def handle_state
    case current_call_status
    when "init"
      current_call.call!
    when "calling"
      current_call.wait!
    when "waiting"
      current_call.answer!
    when "answered"
      current_call.connect!
    when "connected"
      reject_call
    end
  end

  def reject_call
    current_call.cancel_call!
  end
end
