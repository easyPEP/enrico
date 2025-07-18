# encoding: utf-8

require "httparty"
require 'json'
require "addressable/uri"

Dir[File.dirname(__FILE__) + '/enrico/*.rb'].each do |file|
  require file
end
