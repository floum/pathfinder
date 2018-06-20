require "bundler/setup"
require "pathfinder"
require 'aruba'

include Pathfinder

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.include Aruba::Api

  config.before :each do
    restore_env
    setup_aruba 
  end

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
