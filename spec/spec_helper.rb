$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'likeable'
require 'rspec'
require 'rspec/mocks'
require 'factory_girl'
require 'resources/factories/models/track_like_factory'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
