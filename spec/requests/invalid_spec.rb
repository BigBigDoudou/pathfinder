require 'rails_helper'

RSpec.describe 'INVALID MAZES', type: :request do
  describe 'POST /mazes/solve, when maze is invalid' do
    context 'Serial is missing' do
      before { post '/mazes/solve', params: { serial: nil, width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 4
        expect(json[0]['error']).to eq 'missing or invalid serial'
        expect(response).to have_http_status(422)
      end
    end
    context 'Width is missing' do
      before { post '/mazes/solve', params: { serial: 'FSPPPPPP', width: nil } }
      it 'should return an error' do
        expect(json.count).to eq 2
        expect(json[0]['error']).to eq 'missing or invalid width'
        expect(response).to have_http_status(422)
      end
    end
    context 'Width does not respond to to_i' do
      before { post '/mazes/solve', params: { serial: 'FSPPPPPP', width: true } }
      it 'should return an error' do
        expect(json.count).to eq 2
        expect(json[0]['error']).to eq 'missing or invalid width'
        expect(response).to have_http_status(422)
      end
    end
    context 'Width respond to to_i but is not a number' do
      before { post '/mazes/solve', params: { serial: 'FSPPPPPP', width: 'string' } }
      it 'should return an error' do
        expect(json.count).to eq 2
        expect(json[0]['error']).to eq 'missing or invalid width'
        expect(response).to have_http_status(422)
      end
    end
    context 'Width is not positive' do
      before { post '/mazes/solve', params: { serial: 'FSPPPPPP', width: 0 } }
      it 'should return an error' do
        expect(json.count).to eq 2
        expect(json[0]['error']).to eq 'missing or invalid width'
        expect(response).to have_http_status(422)
      end
    end
    context 'Serial and Width are missing' do
      before { post '/mazes/solve', params: { serial: nil, width: nil } }
      it 'should return an error' do
        expect(json.count).to eq 5
        expect(json[0]['error']).to eq 'missing or invalid serial'
        expect(json[1]['error']).to eq 'missing or invalid width'
        expect(response).to have_http_status(422)
      end
    end
    context 'Serial contains forbidden characters' do
      before { post '/mazes/solve', params: { serial: 'FSAPPPPP', width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 2
        expect(json[0]['error']).to eq 'forbidden characters'
        expect(response).to have_http_status(422)
      end
    end
    context 'Serial does not contain S (start)' do
      before { post '/mazes/solve', params: { serial: 'FWWPPPPP', width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 1
        expect(json[0]['error']).to eq 'error with start and/or finish'
        expect(response).to have_http_status(422)
      end
    end
    context 'Serial contains more than one S (start)' do
      before { post '/mazes/solve', params: { serial: 'FSSPPPPP', width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 1
        expect(json[0]['error']).to eq 'error with start and/or finish'
        expect(response).to have_http_status(422)
      end
    end
    context 'Serial does not contain F (finish)' do
      before { post '/mazes/solve', params: { serial: 'SWWPPPPP', width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 1
        expect(json[0]['error']).to eq 'error with start and/or finish'
        expect(response).to have_http_status(422)
      end
    end
    context 'Serial contains more than one F (finish)' do
      before { post '/mazes/solve', params: { serial: 'SFFPPPPP', width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 1
        expect(json[0]['error']).to eq 'error with start and/or finish'
        expect(response).to have_http_status(422)
      end
    end
    context 'Maze is not a rectangle' do
      before { post '/mazes/solve', params: { serial: 'SFWPPPP', width: 4 } }
      it 'should return an error' do
        expect(json.count).to eq 1
        expect(json[0]['error']).to eq 'not rectangle'
        expect(response).to have_http_status(422)
      end
    end
  end
end
