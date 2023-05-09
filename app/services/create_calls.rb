class CreateCalls
  def perform
    create_data
  end

  private
  def create_data
    call = Call.new.save!

    if call
      puts "Created call data"
    else
      puts "Failed to create call data"
    end
  end
end