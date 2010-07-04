module RiotMongoMapper
  class HasAssociationAssertion < Riot::AssertionMacro
    register :has_association

    def evaluate(model, *association_macro_info)
      association_name, key_name, options = association_macro_info
      association = model.associations[key_name.to_s]
      if association.nil?
        fail("expected #{model} to have association #{association}")
      else
        association_valid = association.type == association_name.to_sym
        options_valid = options ? options.all? { |field,value| association.options[field] == value } : true
        options_valid && association_valid ? pass("#{model} has association '#{association_name}' on '#{key_name}' with options #{options.inspect}") :
                                      fail("expected #{model} to have association #{association_name} with options #{options.inspect} on key #{key_name}")
      end
    end
  end
end