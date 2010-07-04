require File.join(File.dirname(__FILE__),'teststrap')

context "has_validation macro" do
  setup { @assertion = RiotMongoMapper::HasValidationAssertion.new }
  setup do
    mock_model do
      key :name, String
      key :rad,  Boolean, :default => false
      key :surname, String

      validates_presence_of :name, :surname
      validates_length_of :surname, :within => 4..40
      validates_uniqueness_of :rad
    end
  end

  asserts "passes when the validation is specified" do
    @assertion.evaluate(topic, :validates_presence_of, :name).first
  end.equals(:pass)

  asserts "passes when the validation is specified" do
    @assertion.evaluate(topic, :validates_presence_of, :surname).first
  end.equals(:pass)

  asserts "returns useful message" do
    @assertion.evaluate(topic, :validates_presence_of, :name).last
  end.matches(/has 'validates_presence_of' validation 'name'/)

  asserts "passes when the validation options is specified" do
    @assertion.evaluate(topic, :validates_length_of, :surname, :within => 4..40).first
  end.equals(:pass)

  asserts "passes when the validation options is specified and doesn't match" do
    @assertion.evaluate(topic, :validates_length_of, :surname, :within => 3..30).first
  end.equals(:fail)

  asserts "fails when invalid field options are specified" do
    @assertion.evaluate(topic, :validates_length_of, :name, :type => Date).first
  end.equals(:fail)

  asserts "passes when another validation is specified" do
    @assertion.evaluate(topic, :validates_uniqueness_of, :rad).first
  end.equals(:pass)
end
