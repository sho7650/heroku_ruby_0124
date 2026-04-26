# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Person CRUD flow', type: :request do
  let(:auth_header) do
    creds = Rails.application.credentials.basic_auth
    { 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(creds.fetch(:username), creds.fetch(:password)) }
  end

  let(:valid_params) do
    {
      person: {
        name: 'Alice',
        birth: '2000-01-01',
        home: 'Tokyo',
        height: '165.0',
        office: 'Acme'
      }
    }
  end

  it 'creates a person and redirects to its show page' do
    expect {
      post '/people', params: valid_params, headers: auth_header
    }.to change(Person, :count).by(1)

    person = Person.last
    expect(response).to redirect_to(person_path(person))

    get response.location, headers: auth_header
    expect(response.body).to include('Alice')
    expect(response.body).to include('Acme')
  end

  it 'rejects invalid params and re-renders the form' do
    bad = valid_params.deep_merge(person: { name: '' })

    expect {
      post '/people', params: bad, headers: auth_header
    }.not_to change(Person, :count)

    expect(response.body).to include("prohibited this person from being saved")
  end

  it 'paginates the index' do
    Person.create!(name: 'Bob', birth: Date.new(1990, 1, 1))
    get '/people', headers: auth_header
    expect(response).to have_http_status(:ok)
    expect(response.body).to include('Bob')
  end
end
