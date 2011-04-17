require 'rubygems'
require 'riot'
require 'mongo_mapper'
require File.expand_path(File.dirname(__FILE__) + '/../lib/riot-mongo_mapper.rb')

class Riot::Situation
  def mock_model(&block)
    mock = Class.new
    mock.class_eval { include MongoMapper::Document }
    mock.class_eval(&block)
    mock
  end
end
