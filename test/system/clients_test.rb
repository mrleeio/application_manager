# frozen_string_literal: true

require 'application_system_test_case'

class ClientsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit clients_url

    assert_selector 'h1', text: 'Clients'
  end

  test 'should create client' do
    client_attributes = FactoryBot.build(:client, :private_equity)

    visit clients_url
    click_link 'New client'

    fill_in 'Name', with: client_attributes.name
    select client_attributes.business_type.titleize, from: 'Business type'
    click_button 'Create Client'

    assert_text I18n.t('client.notice.create.success')
    click_link 'Back'
  end

  test 'should update Client' do
    client = FactoryBot.create(:client, :private_equity)

    visit client_url(client)
    click_link 'Edit this client', match: :first

    fill_in 'Name', with: Faker::Company.name
    select 'Real Estate', from: 'Business type'
    click_button 'Update Client'

    assert_text I18n.t('client.notice.update.success')
    click_link 'Back'
  end

  test 'should destroy Client' do
    client = FactoryBot.create(:client, :private_equity)

    visit client_url(client)
    click_button 'Destroy this client', match: :first

    assert_text I18n.t('client.notice.destroy.success')
  end
end
