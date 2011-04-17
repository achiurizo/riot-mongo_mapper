require File.expand_path(File.dirname(__FILE__) + '/teststrap.rb')
require File.expand_path(File.dirname(__FILE__) + '/fixtures/test.rb')

context "has_plugin macro" do
  setup{ @assertion = RiotMongoMapper::HasPluginAssertion.new }
  setup do
    mock_model do
      plugin Plugins::Test
    end
  end
  
  asserts "passes when has plugin" do 
    @assertion.evaluate(topic, Plugins::Test).first
  end.equals(:pass)
  
  asserts "fails when it doesn't have plugin" do 
    @assertion.evaluate(topic, Plugins::Faux).first
  end.equals(:fail)
  
  asserts "returns a message" do 
    @assertion.evaluate(topic, Plugins::Test).last
  end.matches %r{has plugin Plugins::Test}  
end