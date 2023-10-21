# frozen_string_literal: true

require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = FactoryBot.create(:client, :private_equity)
    @client_attributes = FactoryBot.build(:client, :private_equity)
  end

  test 'should get index' do
    get clients_url

    assert_response :success
  end

  test 'should get new' do
    get new_client_url

    assert_response :success
  end

  test 'should create client' do
    assert_difference('Client.count') do
      post clients_url,
           params: { client: { name: @client_attributes.name, business_type: @client_attributes.business_type } }
    end

    assert_redirected_to client_url(Client.where(name: @client_attributes.name).first)
  end

  test 'should show client' do
    get client_url(@client)

    assert_response :success
  end

  test 'should get edit' do
    get edit_client_url(@client)

    assert_response :success
  end

  test 'should update client' do
    patch client_url(@client), params: { client: { name: @client.name, business_type: @client.business_type } }

    assert_redirected_to client_url(@client)
  end

  test 'should destroy client' do
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end
end
