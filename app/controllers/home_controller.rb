class HomeController < ApplicationController
  def initialize
    @status = CallsController.new.status
    @has_data = CallsController.new.has_data
  end

  def index
    render "/home", with: { status: @status, has_data: @has_data }
  end

  def change_status
    CallsController.new.change_status
    redirect_to root_path
  end

  def initialize_call
    CallsController.new.initialize_call
    redirect_to root_path
  end

  def cancel_call
    CallsController.new.cancel_call
    redirect_to root_path
  end
end