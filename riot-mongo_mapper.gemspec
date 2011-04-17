Gem::Specification.new do |s|
  s.name = "riot-mongo_mapper"
  s.version = "0.1.0"
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
  s.add_dependency 'mongo_mapper', '~>0.9.0'
  s.add_dependency 'riot', '~>0.12.3'
end

