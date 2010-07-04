require File.join(File.dirname(__FILE__),'teststrap')

context "has_key macro" do
  setup { @assertion = RiotMongoMapper::HasKeyAssertion.new }
  setup do
    mock_model do
      key :name, String
      key :foo,  Boolean, :default => false
      key :age,  Integer, :required => true, :default => 18
    end
  end

  asserts "passes when the key is specified" do
    @assertion.evaluate(topic, :name, String).first
  end.equals(:pass)
  
  asserts "fails when the key doesn't match" do 
    @assertion.evaluate(topic, :name, Array).first
  end.equals(:fail)
  
  asserts "passes when options are specified" do 
    @assertion.evaluate(topic, :age, Integer, :required => true, :default => 18).first
  end.equals(:pass)
  
  asserts "fails when the options specifed don't match" do 
    @assertion.evaluate(topic, :foo, Boolean, :default => true).first
  end.equals(:fail)

  asserts "returns a message" do 
    @assertion.evaluate(topic, :name, String).last
  end.matches %r{has key 'name' with options}


end
