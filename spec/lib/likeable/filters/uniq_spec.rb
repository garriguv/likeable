require 'spec_helper'
require 'likeable/filters/uniq'

describe Likeable::Filters::Uniq do
  describe '#filter_likes' do
    let (:like) { Likeable::Models::TrackLike.new('2', 'the title', '') }
    let (:likes) { [ like, like ] }

    it 'returns a de-duplicated list of likes' do
      expect(subject.filter_likes(likes)).to eq [ like ]
    end
  end
end
