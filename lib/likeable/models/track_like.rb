module Likeable
  module Models
    class TrackLike < Struct.new(:id, :title, :created_at, :duration)
    end
  end
end
