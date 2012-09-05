require "free_text/version"

module FreeText

  class Engine < Rails::Engine
    isolate_namespace FreeText
    initializer 'engine.helper' do |app|
      ActionView::Base.send :include, TextHelper
    end
  end

  mattr_accessor :authentication
  @@authentication = Proc.new {|controller| true}

  # Aloha's plugin enabled
  mattr_accessor :plugins
  @@plugins = ""

  # Aloha configuration
  mattr_accessor :settings
  @@settings = ""

  # Proc wich give a list of items
  mattr_accessor :getRepositories
  @@getRepositories = Proc.new { |c| {} }

  # Proc wich give a list of items
  mattr_accessor :alohaVersion
  @@alohaVersion = "0.10.0"

  def self.setup
    yield self
  end
end
