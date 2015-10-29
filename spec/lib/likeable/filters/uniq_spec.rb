require 'spec_helper'
require 'likeable/filters/uniq'

describe Likeable::Filters::Uniq do
  describe '#filter_likes' do
    let (:likes) { [ build(:track_like, id: '2'), build(:track_like, id: '2') ] }

    it 'returns a de-duplicated list of likes' do
      expect(subject.filter_likes(likes).count).to eq 1
    end
  end
end
