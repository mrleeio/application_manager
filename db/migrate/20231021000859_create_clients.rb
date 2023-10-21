# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.1]
  def up
    create_enum :business_type, %w[private_equity real_estate]

    create_table :clients, id: :uuid do |t|
      t.string :name, null: false
      t.enum :business_type, enum_type: 'business_type', default: 'private_equity', null: false

      t.timestamps

      t.index :name, unique: true
    end
  end

  def down
    drop_table :clients
    drop_enum :business_type
  end
end
