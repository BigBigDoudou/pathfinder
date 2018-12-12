ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'spec_helper'
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
abort('The Rails environment is running in production mode!') if Rails.env.production?

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper
  config.include MazeSpecHelper

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
