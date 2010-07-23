module RiotMongoMapper
  class HasPluginAssertion < Riot::AssertionMacro
    register :has_plugin

    def evaluate(model, plugin)
      assert = model.respond_to?(:plugins) ? model.plugins.include?(plugin) : model.class.plugins.include?(plugin)
      if assert
        pass("#{model} has plugin #{plugin.inspect}")
      else
        fail("expected #{model} to have plugin #{plugin.inspect}")
      end
    end
  end
end