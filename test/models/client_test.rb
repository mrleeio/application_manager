# frozen_string_literal: true

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  context 'validations' do
    subject { FactoryBot.build(:client, :private_equity) }

    should define_enum_for(:business_type).backed_by_column_of_type(:enum)

    should validate_presence_of(:business_type)
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
  end
end
