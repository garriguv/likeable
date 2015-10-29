module Likeable::Filters
  class TopTracks < Filter
    def filter_likes(likes)
      likes
        .sort_by { |like| likes.count { |_like| _like.id == like.id } }
        .uniq
        .reverse
    end
  end
end
