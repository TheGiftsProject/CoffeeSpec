def initialize_testing_environment

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  Dir["#{Rails.root}/spec/spec_helpers/*.rb"].each do |file|
    require file
  end

  RSpec.configure do |config|
    # == Mock Framework
    config.mock_with :rspec
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
  end

end


require 'spork'

# check if spork listener is active
if Spork.using_spork?

  require 'spork/ext/ruby-debug'

  Spork.prefork do
    initialize_testing_environment
    ActiveSupport::Dependencies.clear
    ActiveRecord::Base.instantiate_observers
  end

  Spork.each_run do
    FactoryGirl.factories.clear
    require File.expand_path("../factories", __FILE__)

    #We want spork to refresh all the lib directory for each run so we won't have to reload guard
    Dir["#{Rails.root}/lib/**/*.rb"].each do |file|
      load file
    end

    #We need this for guard to refresh the spec_helpers for each run
    Dir["#{Rails.root}/spec/spec_helpers/*.rb"].each do |file|
      load file
    end

  end

else
  initialize_testing_environment
end
