require 'faraday'
require 'faraday_middleware'
require 'json'
require 'likeable/models'

module Likeable
  module Api
    class ApiClient
      def initialize(api_config)
        @conn = create_conn(api_config)
      end

      def get_me
        response = conn.get('/me')
        Models::User.new(response.body['id'], response.body['username'])
      end

      def get_followings(user)
        followings = paginate_request("/users/#{user.id}/followings")
        followings.map { |e| Models::User.new(e['id'], e['username']) }
      end

      def get_likes(user)
        response = conn.get("/users/#{user.id}/favorites", limit: 100)
        response.body.
            select { |like| like['kind'].eql?('track') }.
            map { |like| Models::TrackLike.new(like['id'], like['title'], Date.parse(like['created_at']), like['duration']) }
      end

      def post_playlist(tracks, title)
        conn.post('/playlists') do |request|
          request.headers['Content-Type'] = 'application/json'
          request.body = {
              playlist: {
                  title: title,
                  sharing: 'private',
                  tracks: tracks.map { |track| {id: track.id} }
              }
          }.to_json
        end
      end

      private
      attr_reader :conn

      def paginate_request(path, limit = 100, offset = 0, json = [])
        response = conn.get(path) do |builder|
          builder.params['limit'] = limit
          builder.params['offset'] = offset
        end
        additional_json = response.body
        if additional_json.empty?
          json
        else
          paginate_request(path, limit, offset + limit, json + additional_json)
        end
      end

      def create_conn(api_config)
        Faraday.new(:url => 'http://api.soundcloud.com') do |builder|
          builder.request :url_encoded
          builder.adapter Faraday.default_adapter
          builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/
          builder.use ApiLogger

          builder.headers['Accept'] = 'application/json'
          builder.params['client_id'] = api_config.client_id
          builder.params['oauth_token'] = api_config.access_token
        end
      end
    end
  end
end
