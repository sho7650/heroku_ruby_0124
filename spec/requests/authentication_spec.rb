# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HTTP basic authentication', type: :request do
  describe 'GET /people' do
    context 'without credentials' do
      it 'returns 401 Unauthorized' do
        get '/people'
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with wrong credentials' do
      it 'returns 401 Unauthorized' do
        get '/people', headers: {
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('admin', 'wrong')
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with correct credentials' do
      it 'returns 200 OK' do
        creds = Rails.application.credentials.basic_auth
        get '/people', headers: {
          'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(creds.fetch(:username), creds.fetch(:password))
        }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
