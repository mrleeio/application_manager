# frozen_string_literal: true

class Client < ApplicationRecord
  enum business_type: {
    private_equity: 'private_equity',
    real_estate: 'real_estate'
  }, _prefix: true

  validates :business_type, inclusion: { in: business_types.keys }
  validates :business_type, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
end
