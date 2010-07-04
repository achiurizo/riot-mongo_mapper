module RiotMongoMapper
  class HasKeyAssertion < Riot::AssertionMacro
    register :has_key

    def evaluate(model, *key_macro_info)
      key_name, key_type, options = key_macro_info
      key = model.keys[key_name.to_sym]
      if key.nil?
        fail("expected #{model} to have field #{key_name}")
      else
        type_valid = (key.type == key_type)
        options_valid = options ? options.all? { |field,value| key.options[field] == value } : true
        options_valid && type_valid ? pass("#{model} has key '#{key_name}' with options #{options.inspect}") :
                                      fail("expected #{model} to have options #{options.inspect} on key #{key_name}")
      end
    end
  end
end