# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:valid_attributes) do
    {
      name: 'Alice',
      birth: Date.new(2000, 1, 1),
      home: 'Tokyo',
      height: 165.0,
      office: 'Acme'
    }
  end

  describe 'validations' do
    it 'is valid with all attributes' do
      expect(Person.new(valid_attributes)).to be_valid
    end

    describe '#name' do
      it 'is invalid when blank' do
        expect(Person.new(valid_attributes.merge(name: ''))).not_to be_valid
      end

      it 'is invalid when too long' do
        expect(Person.new(valid_attributes.merge(name: 'a' * 257))).not_to be_valid
      end
    end

    describe '#birth' do
      it 'is invalid when missing' do
        expect(Person.new(valid_attributes.merge(birth: nil))).not_to be_valid
      end

      it 'is invalid when in the future' do
        expect(Person.new(valid_attributes.merge(birth: Date.current + 1))).not_to be_valid
      end

      it 'is valid when today' do
        expect(Person.new(valid_attributes.merge(birth: Date.current))).to be_valid
      end
    end

    describe '#height' do
      it 'allows nil' do
        expect(Person.new(valid_attributes.merge(height: nil))).to be_valid
      end

      it 'is invalid when zero or negative' do
        expect(Person.new(valid_attributes.merge(height: 0))).not_to be_valid
        expect(Person.new(valid_attributes.merge(height: -1))).not_to be_valid
      end

      it 'is invalid when absurdly large' do
        expect(Person.new(valid_attributes.merge(height: 300))).not_to be_valid
      end
    end

    describe '#home and #office' do
      it 'are invalid when over 256 chars' do
        expect(Person.new(valid_attributes.merge(home:   'a' * 257))).not_to be_valid
        expect(Person.new(valid_attributes.merge(office: 'a' * 257))).not_to be_valid
      end
    end
  end

  describe '#age' do
    around { |ex| travel_to(Date.new(2026, 4, 26)) { ex.run } }

    it 'returns nil when birth is nil' do
      expect(Person.new(valid_attributes.merge(birth: nil)).age).to be_nil
    end

    it 'returns full years on the day after birthday' do
      expect(Person.new(valid_attributes.merge(birth: Date.new(2000, 4, 25))).age).to eq(26)
    end

    it 'returns full years on the birthday itself' do
      expect(Person.new(valid_attributes.merge(birth: Date.new(2000, 4, 26))).age).to eq(26)
    end

    it 'subtracts one before the birthday' do
      expect(Person.new(valid_attributes.merge(birth: Date.new(2000, 4, 27))).age).to eq(25)
    end

    it 'handles Feb 29 leap-day birthdays without crashing' do
      expect(Person.new(valid_attributes.merge(birth: Date.new(2000, 2, 29))).age).to eq(26)
    end
  end
end
