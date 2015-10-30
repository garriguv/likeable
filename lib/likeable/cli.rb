require 'thor'
require 'likeable'
require 'yaml'

module Likeable
  class CLI < Thor
    class_option :client_id
    class_option :access_token

    desc 'create_playlist', "Create a playlist made of your following's likes"
    option :year, aliases: '-y', type: :numeric, required: true, desc: "Selected year for your following's likes"
    option :month, aliases: '-m', type: :numeric, required: true, desc: "Selected month for your following's likes"
    option :top, type: :boolean, desc: "Order tracks by number of likes"
    def create_playlist
      Likeable.create_playlist(
          options[:client_id],
          options[:access_token],
          options[:year],
          options[:month],
          options[:top])
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
