require 'spec_helper'
require 'likeable/filters/filter'

describe Likeable::Filters::Filter do
  describe '#filter_likes' do
    let (:likes) { [ Likeable::Models::TrackLike.new('2', 'the title', '') ] }

    it 'returns the likes' do
      expect(subject.filter_likes(likes)).to eq likes
    end
  end
end
