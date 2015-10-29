require 'date'

module Likeable::Filters
  class YearMonth
    def initialize(year, month)
      @year = year
      @month = month
    end

    def filter_likes(likes)
      likes.select { |like| like.created_at.year == year && like.created_at.month == month }
    end

    private
    attr_reader :year, :month
  end
end
