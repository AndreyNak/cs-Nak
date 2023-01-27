# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mode, type: :model do
  subject(:mode) { create(:mode) }

  let(:server) { build(:server, count_users: 10, map:) }
  let(:map) { build(:map) }

  describe '#count_users' do
    subject { mode.count_users }

    context 'without server' do
      before { mode.servers = [] }

      it { is_expected.to be_zero }
    end

    context 'with server' do
      before { mode.servers << server }

      it { is_expected.to eq(10) }
    end

    context 'with several servers' do
      before do
        3.times { mode.servers << build(:server, count_users: 10, map:) }
      end

      it { is_expected.to eq(30) }
    end

    context 'with several servers but all zero users' do
      before do
        3.times { mode.servers << build(:server, count_users: 0, map:) }
      end

      it { is_expected.to eq(0) }
    end
  end
end
