# == Schema Information
#
# Table name: venues
#
#  id                :uuid             not null, primary key
#  name              :string           not null
#  short_description :text             not null
#  long_description  :text             not null
#  address           :text             not null
#  lat               :decimal(8, 6)    not null
#  lng               :decimal(9, 6)    not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

# validates :name, presence: true, length: { maximum: 25 }
# validates :short_description, presence: true, length: { maximum: 50 }
# validates :long_description, presence: true, length: { maximum: 500 }
# validates :address, presence: true, length: { maximum: 50 }
# validates :lat, presence: true, length: { maximum: 15 }, numericality: true
# validates :lng, presence: true, length: { maximum: 15 }, numericality: true
#
require 'rails_helper'

RSpec.describe Venue, type: :model do
  context 'happy path' do
    it 'should save valid venue successfully' do
      v = FactoryBot.build(:venue).save
      expect(v).to eq(true)
    end

    it 'should be able to retrieve saved venues' do
      v1 = FactoryBot.create(:venue)
      v2 = FactoryBot.create(:venue)
      expect(Venue.all).to include(v1, v2)
    end

    it 'should return the correct number of venues created' do
      5.times { FactoryBot.create(:venue) }
      expect(Venue.all.size).to eq(5)
    end
  end

  context 'validation tests' do
    describe 'absence of required fields' do
      it 'is not valid without name' do
        v = FactoryBot.build(:venue, name: nil)
        expect(v).to_not be_valid
      end

      it 'is not valid without short description' do
        v = FactoryBot.build(:venue, short_description: nil)
        expect(v).to_not be_valid
      end

      it 'is not valid without long description' do
        v = FactoryBot.build(:venue, long_description: nil)
        expect(v).to_not be_valid
      end

      it 'is not valid without short description' do
        v = FactoryBot.build(:venue, short_description: nil)
        expect(v).to_not be_valid
      end

      it 'is not valid without address' do
        v = FactoryBot.build(:venue, address: nil)
        expect(v).to_not be_valid
      end

      it 'is not valid without latitude' do
        v = FactoryBot.build(:venue, lat: nil)
        expect(v).to_not be_valid
      end

      it 'is not valid without longitude' do
        v = FactoryBot.build(:venue, lng: nil)
        expect(v).to_not be_valid
      end
    end

    describe 'length violations' do
      it 'name should be a maximum of 25 characters' do
        valid_venue =
          FactoryBot.build(:venue, name: '1231231231231231231231231')
        expect(valid_venue).to be_valid
        invalid_venue =
          FactoryBot.build(:venue, name: '12345123451234512345123451')
        expect(invalid_venue).to_not be_valid
      end

      it 'short desc should be a max of 50 characters' do
        invalid_venue = FactoryBot.build(:venue, :with_short_desc_of_51chars)
        expect(invalid_venue).to_not be_valid
      end

      it 'long desc should be a max of 500 characters' do
        invalid_venue = FactoryBot.build(:venue, :with_long_desc_of_501chars)
        expect(invalid_venue).to_not be_valid
      end

      it 'address should be a max of 50 characters' do
        invalid_venue = FactoryBot.build(:venue, :with_address_of_51chars)
        expect(invalid_venue).to_not be_valid
      end

      context 'database level' do
        it 'lat should be a 8,6 decimal' do
          # This way I test for validation in database level, Probably not needed?
          expect {
            FactoryBot.create(:venue, lat: '121.121212')
          }.to raise_error(ActiveRecord::RangeError)
          expect { FactoryBot.create(:venue, lat: 'aa.abbbb') }.to raise_error(
            ActiveRecord::RecordInvalid,
          )

          expect {
            FactoryBot.create(:venue, lat: '12.121212')
          }.to_not raise_error
        end

        it 'lng should be a 9,6 decimal' do
          # This way I test for validation in database level
          expect {
            FactoryBot.create(:venue, lng: '1212.121212')
          }.to raise_error(ActiveRecord::RangeError)
          expect { FactoryBot.create(:venue, lng: 'aa.bbbb') }.to raise_error(
            ActiveRecord::RecordInvalid,
          )
          expect {
            FactoryBot.create(:venue, lng: '121.121212')
          }.to_not raise_error
        end
      end
    end
  end
end
