require File.expand_path('../teststrap', __FILE__)
require File.expand_path('../fixtures/test', __FILE__)

context "has_plugin macro" do
  helper(:macro) { RiotMongoMapper::HasPluginAssertion.new }

  setup do
    mock_model do
      plugin Plugins::Test
    end
  end
  
  asserts "passes when has plugin" do
    macro.evaluate(topic, Plugins::Test).first
  end.equals(:pass)
  
  asserts "fails when it doesn't have plugin" do
    macro.evaluate(topic, Plugins::Faux).first
  end.equals(:fail)
  
  asserts "returns a message" do
    macro.evaluate(topic, Plugins::Test).last
  end.matches %r{has plugin Plugins::Test}
end
