# == Schema Information
#
# Table name: venues
#
#  id                :uuid             not null, primary key
#  name              :string
#  short_description :text
#  long_description  :text
#  address           :text
#  lat               :decimal(8, 6)
#  lng               :decimal(9, 6)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Venue, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
    end
  end

  context 'scope tests' do
  end
end
