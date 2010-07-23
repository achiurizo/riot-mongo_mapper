module RiotMongoMapper
  class HasPluginAssertion < Riot::AssertionMacro
    register :has_plugin

    def evaluate(model, plugin)
      if model.plugins.include? plugin
        pass("#{model} has plugin #{plugin.inspect}")
      else
        fail("expected #{model} to have plugin #{plugin.inspect}")
      end
    end
  end
end