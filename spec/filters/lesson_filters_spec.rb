# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LessonFilters do
  let(:lesson) { create(:lesson, title: 'Some title') }
  let(:lesson1) { create(:lesson, title: 'How to get a lot of money') }

  let(:lessons) { Lesson.all }

  describe '#call' do
    subject { described_class.call(lessons, params) }

    context 'without params' do
      let(:params) { {} }

      it { is_expected.to include(lesson) }
    end

    context 'with param' do
      let(:params) { { search: 'Some title' } }

      it { is_expected.to include(lesson) }
    end

    context 'when param upper case' do
      let(:params) { { search: 'SOME TITLE' } }

      it { is_expected.to include(lesson) }
    end

    context 'when param lower case' do
      let(:params) { { search: 'some title' } }

      it { is_expected.to include(lesson) }
    end

    context 'when write part of title' do
      let(:params) { { search: 'some' } }

      it { is_expected.to include(lesson) }
    end

    context 'when search non exist lesson' do
      let(:params) { { search: 'i want a smoothie' } }

      it { is_expected.not_to include(lesson) }
    end

    context 'when only correctly lessons' do
      let(:params) { { search: 'How to get a lot of money' } }

      it { is_expected.not_to include(lesson) }
      it { is_expected.to include(lesson1) }
    end
  end
end
