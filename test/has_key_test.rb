require File.expand_path('../teststrap', __FILE__)

context "has_key macro" do
  helper(:macro) { RiotMongoMapper::HasKeyAssertion.new }

  setup do
    mock_model do
      key :name, String
      key :foo,  Boolean, :default => false
      key :age,  Integer, :required => true, :default => 18
    end
  end

  asserts "passes when the key is specified" do
    macro.evaluate(topic, :name, String).first
  end.equals(:pass)
  
  asserts "fails when the key doesn't match" do
    macro.evaluate(topic, :name, Array).first
  end.equals(:fail)
  
  asserts "passes when options are specified" do
    macro.evaluate(topic, :age, Integer, :required => true, :default => 18).first
  end.equals(:pass)
  
  asserts "fails when the options specifed don't match" do
    macro.evaluate(topic, :foo, Boolean, :default => true).first
  end.equals(:fail)

  asserts "returns a message" do
    macro.evaluate(topic, :name, String).last
  end.matches %r{has key 'name' with options}


end
