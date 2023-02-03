# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  subject(:friend_request) { create(:friend_request, profile:, friend:) }

  let(:profile) { build(:profile) }
  let(:friend) { build(:profile) }

  it { is_expected.to be_valid }

  describe '#accept_friend' do
    subject(:accept_request) { friend_request.accept_friend }

    it 'be destroyed & creted 2 friendships' do
      expect(accept_request).to be_destroyed
      expect(Friendship.count).to eq(2)
    end
  end
end
