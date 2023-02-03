# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServerFilters do
  let(:server) do
    create(:server, prime: true, mode: build(:mode), map: build(:map))
  end

  let(:server1) do
    create(:server, name: 'de_mirage', prime: true, mode: build(:mode), map: build(:map, name: 'de_mirage'))
  end

  let(:servers) { Server.all }

  before do
    server.save
    server1.save
    servers
  end

  describe '#call' do
    subject { described_class.call(servers, params) }

    context 'without params' do
      let(:params) { {} }

      it { is_expected.to include(server) }
    end

    context 'with param' do
      let(:params) { { search: 'de_dust2' } }

      it { is_expected.to include(server) }
    end

    context 'when param upper case' do
      let(:params) { { search: 'DE_DUST2' } }

      it { is_expected.to include(server) }
    end

    context 'when write part of name' do
      let(:params) { { search: 'dust' } }

      it { is_expected.to include(server) }
    end

    context 'when search non exist name' do
      let(:params) { { search: 'arena' } }

      it { is_expected.not_to include(server) }
    end

    context 'when only correctly names' do
      let(:params) { { search: 'de_mirage' } }

      it { is_expected.not_to include(server) }
      it { is_expected.to include(server1) }
    end

    context 'when prime true' do
      let(:non_prime_server) do
        create(:server, name: 'de_inferno', mode: build(:mode), map: build(:map))
      end

      let(:params) { { prime: 'on' } }

      it { is_expected.not_to include(non_prime_server) }
      it { is_expected.to include(server) }
    end

    context 'when prime params is nil' do
      let(:non_prime_server) do
        create(:server, name: 'de_inferno', mode: build(:mode), map: build(:map))
      end

      let(:params) { { prime: nil } }

      it { is_expected.not_to include(non_prime_server) }
      it { is_expected.to include(server) }
    end

    context 'when prime params is true' do
      let(:non_prime_server) do
        create(:server, name: 'de_inferno', mode: build(:mode), map: build(:map))
      end

      let(:params) { { prime: true } }

      it { is_expected.not_to include(non_prime_server) }
      it { is_expected.to include(server) }
    end

    context 'when prime params is false' do
      let(:non_prime_server) do
        create(:server, name: 'de_inferno', mode: build(:mode), map: build(:map))
      end

      let(:params) { { prime: false } }

      it { is_expected.to include(non_prime_server) }
      it { is_expected.not_to include(server) }
    end

    context 'when prime false' do
      let(:non_prime_server) do
        create(:server, name: 'de_inferno', mode: build(:mode), map: build(:map))
      end

      let(:params) { { prime: 'off' } }

      it { is_expected.to include(non_prime_server) }
      it { is_expected.not_to include(server) }
    end

    context 'when only current map' do
      let(:params) { { map: 'de_mirage' } }

      it { is_expected.to include(server1) }
      it { is_expected.not_to include(server) }
    end

    context 'when non exist map' do
      let(:params) { { map: 'de_map' } }

      it { is_expected.to be_empty }
    end

    context 'with all params' do
      let(:params) { { map: 'de_mirage', prime: true, search: 'de_mirage' } }

      it { is_expected.to include(server1) }
      it { is_expected.not_to include(server) }
    end
  end
end
