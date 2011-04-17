module RiotMongoMapper
  class HasAssociationAssertion < Riot::AssertionMacro
    register :has_association

    def evaluate(model, *association_macro_info)
      association_name, key_name, options = association_macro_info
      association = model.associations[key_name.to_sym]
      association_class = case association_name
        when :many
          MongoMapper::Plugins::Associations::ManyAssociation
        when :one
          MongoMapper::Plugins::Associations::OneAssociation
        end
      if association.nil?
        fail("expected #{model} to have association #{association}")
      else
        association_valid = association.class == association_class
        options_valid = options ? options.all? { |field,value| association.options[field] == value } : true
        options_valid && association_valid ? pass("#{model} has association '#{association_name}' on '#{key_name}' with options #{options.inspect}") :
                                             fail("expected #{model} to have association #{association_name} with options #{options.inspect} on key #{key_name}")
      end
    end
  end
end