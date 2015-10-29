require 'factory_girl'

require 'likeable/models/track_like'

FactoryGirl.define do
  factory :track_like, class: Likeable::Models::TrackLike do
    id '123'
    title 'the title'
    created_at Date.today

    # initialize_with { new(id: id, title: title, created_at: created_at) }
  end
end
