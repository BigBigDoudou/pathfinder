require 'rails_helper'

RSpec.describe 'UNSOLVABLE MAZES', type: :request do
  describe 'POST /mazes/solve, when maze is valid and unsolvable' do
    context 'UNSOLVABLE 1' do
      before { post '/mazes/solve', params: unsolvable_1 }
      it 'should return an error message' do
        expect(json['path_found']).to be false
        expect(json['error']).to eq 'unsolvable maze: finish can not be reached'
        expect(json['calculation_time']).not_to be nil
        expect(response).to have_http_status(200)
      end
    end
    context 'UNSOLVABLE 2' do
      before { post '/mazes/solve', params: unsolvable_2 }
      it 'should return an error message' do
        expect(json['path_found']).to be false
        expect(json['error']).to eq 'unsolvable maze: finish can not be reached'
        expect(json['calculation_time']).not_to be nil
        expect(response).to have_http_status(200)
      end
    end
    context 'UNSOLVABLE 3' do
      before { post '/mazes/solve', params: unsolvable_3 }
      it 'should return an error message' do
        expect(json['path_found']).to be false
        expect(json['error']).to eq 'unsolvable maze: finish can not be reached'
        expect(json['calculation_time']).not_to be nil
        expect(response).to have_http_status(200)
      end
    end
    context 'UNSOLVABLE 4' do
      before { post '/mazes/solve', params: unsolvable_4 }
      it 'should return an error message' do
        expect(json['path_found']).to be false
        expect(json['error']).to eq 'unsolvable maze: finish can not be reached'
        expect(json['calculation_time']).not_to be nil
        expect(response).to have_http_status(200)
      end
    end
  end
end
