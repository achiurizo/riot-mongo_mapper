Gem::Specification.new do |s|
  s.name = "riot-mongo_mapper"
  s.version = "0.0.3"
  s.required_rubygems_version = ">= 1.3.6"
  s.authors = ["Arthur Chiu"]
  s.date = Time.now.strftime("%Y-%m-%d")
  s.description = "A collection of assertion macros for testing MongoMapper with Riot"
  s.email = "mr.arthur.chiu@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = %w{LICENSE README.md Rakefile riot-mongo_mapper.gemspec} + Dir.glob("{lib,test}/**/*")
  s.homepage = %q{http://github.com/achiu/riot-mongo_mapper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{Riot assertions for MongoMapper}
  s.add_development_dependency(%q<riot>, [">= 0"])
  s.add_development_dependency(%q<yard>, [">= 0"])
  s.add_runtime_dependency(%q<mongo_mapper>, [">= 0.8.2"])
  s.add_runtime_dependency(%q<riot>, [">= 0.11.2"])
end

