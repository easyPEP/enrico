#we need the actual library file
require_relative '../lib/enrico'
# For Ruby < 1.9.3, use this instead of require_relative
# require(File.expand_path('../../lib/dish', __FILE__))
#dependencies
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
# require 'turn'

# Turn.config do |c|
  # :outline  - turn's original case/test outline mode [default]
#   c.format  = :outline
  # turn on invoke/execute tracing, enable full backtrace
#   c.trace   = true
  # use humanized test names (works only with :outline format)
#   c.natural = true
# end

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = './spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end
