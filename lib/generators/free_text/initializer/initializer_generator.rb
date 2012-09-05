module FreeText
  module Generators
    class InitializerGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
 
      def copy_initializer
        copy_file "free-text.rb", "config/initializers/free-text.rb"
        copy_file "free_text_repository_helper.rb", "app/helpers/free_text_repository_helper.rb"
        copy_file "migration_create_free_text_texts.rb", "db/migrate/#{Time.new.strftime("%Y%m%d%H%M%S")}_create_free_text_texts.rb"
#        route "match '/freetext-repositories' => 'free_text_repository#get', :as => :free_text_repository"
        readme "README"
      end
    end
  end
end