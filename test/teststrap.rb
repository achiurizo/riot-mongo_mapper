require 'rubygems'
require 'riot'
require 'mongo_mapper'
require File.join(File.dirname(__FILE__),'..','lib','riot-mongo_mapper')


class Riot::Situation
  def mock_model(&block)
    mock = Class.new
    mock.class_eval { include MongoMapper::Document }
    mock.class_eval(&block)
    mock
  end
end
