require 'spec_helper'
require 'likeable/filters/uniq'

describe Likeable::Filters::TopTracks do
  describe '#filter_likes' do
    let (:likes) { [
      build(:track_like, id: '2'),
      build(:track_like, id: '1'),
      build(:track_like, id: '1'),
      build(:track_like, id: '3'),
      build(:track_like, id: '1'),
      build(:track_like, id: '2') ]
    }
    let (:expected_likes) { [
        build(:track_like, id: '1'),
        build(:track_like, id: '2'),
        build(:track_like, id: '3')
      ]
    }

    it 'returns a de-duplicated list of likes' do
      expect(subject.filter_likes(likes)).to eq expected_likes
    end
  end
end
