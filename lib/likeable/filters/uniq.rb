module Likeable::Filters
  class Uniq < Filter
    def filter_likes(likes)
      likes.uniq
    end
  end
end
