require 'spec_helper'
require 'likeable/filters/year_month'

describe Likeable::Filters::YearMonth do
  subject { Likeable::Filters::YearMonth.new(2015, 10) }

  describe '#filter_likes' do
    let (:like_1) { Likeable::Models::TrackLike.new('1', 'the title', Date.new(2015, 10, 15)) }
    let (:like_2) { Likeable::Models::TrackLike.new('2', 'the title', Date.new(2015, 11, 15)) }
    let (:likes) { [ like_1, like_2 ] }

    it 'returns a de-duplicated list of likes' do
      expect(subject.filter_likes(likes)).to eq [ like_1 ]
    end
  end
end
