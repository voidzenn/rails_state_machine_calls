desc 'Create call data'
task create_calls_data: [:environment] do
  CreateCalls.new.perform
end
