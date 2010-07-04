require 'riot'
require 'mongo_mapper'

Dir[File.dirname(__FILE__) + '/riot-mongo_mapper/*.rb'].each {|file| require file }