require 'date'

module Likeable::Filters
  class YearMonth
    def initialize(year, month, duration)
      @year = year
      @month = month
      @duration = duration
    end

    def filter_likes(likes)
      likes.select { |like| like.created_at.year == year && like.created_at.month == month && like.duration < duration * 1000 * 60}
    end

    private
    attr_reader :year, :month, :duration
  end
end
