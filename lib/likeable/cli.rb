require 'thor'
require 'likeable/api/api_config'

module Likeable
  class CLI < Thor
    class_option :client_id
    class_option :access_token

    desc 'create_playlist', "Create a playlist made of your following's likes"
    option :year, aliases: '-y', type: :numeric, required: true
    option :month, aliases: '-m', type: :numeric, required: true
    def create_playlist
      Likeable.create_playlist(
          Api::ApiConfig.new(options[:client_id], options[:access_token]),
          options[:year],
          options[:month])
    end

    default_task :create_playlist

    private
    def options
      original_options = super
      return original_options unless File.exists?('.likeable.yml')
      defaults = YAML.load_file('.likeable.yml') || {}
      Thor::CoreExt::HashWithIndifferentAccess.new(defaults.merge(original_options))
    end
  end
end
