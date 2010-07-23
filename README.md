# riot-mongo_mapper

Riot assertions for MongoMapper

## Examples

    context "Photo Model" do

      context 'definition' do
        setup { Photo }
        
        # field associations
        asserts_topic.has_key :title, String
        asserts_topic.has_key :caption, String, :default => ""

        # association assertions
        asserts_topic.has_association :many, :accounts
        asserts_topic.has_association :one, :comments
        asserts_topic.has_association :many, :persons, :in => :persons_id
        
        # validation assertions
        asserts_topic.has_validation :validates_presence_of, :caption
        
        # plugin assertions
        asserts_topic.has_plugin Plugins::SomePlugin
      end
    end
    

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Arthur Chiu. See LICENSE for details.
