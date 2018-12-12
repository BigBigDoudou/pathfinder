require 'rails_helper'

RSpec.describe 'WAKE SERVER UP', type: :request do
  describe 'GET /mazes/server' do
    context 'Wake the server up' do
      before { get '/mazes/server' }
      it 'should return true' do
        expect(json['server']).to eq true
        expect(response).to have_http_status(200)
      end
    end
  end
end
