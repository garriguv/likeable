require 'likeable/version'
require 'likeable/api'
require 'likeable/filters'

module Likeable
  extend self

  def create_playlist(client_id, access_token, year, month, top, duration)
    api = Api::ApiClient.new(Api::ApiConfig.new(client_id, access_token))
    user = api.get_me
    followings = api.get_followings(user)
    likes = followings.flat_map { |e| api.get_likes(e) }
    selected_likes = filter_likes(likes, year, month, top, duration)
    api.post_playlist(selected_likes.take(500).shuffle, "#{year}-#{month}")
  end

  private
  def filter_likes(likes, year, month, top, duration)
    filters(year, month, top, duration).each { |filter|
      likes = filter.filter_likes(likes)
    }
    likes
  end

  def filters(year, month, top, duration)
    filters = [ Filters::YearMonth.new(year, month, duration) ]
    if top
      filters << Filters::TopTracks.new
    else
      filters << Filters::Uniq.new
    end
  end
end
