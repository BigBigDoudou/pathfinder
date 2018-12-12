require 'rails_helper'

RSpec.describe 'SOLVABLE MAZES', type: :request do
  describe 'POST /mazes/solve, when maze is valid and solvable' do
    context 'ONE ROAD' do
      before { post '/mazes/solve', params: one_road }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 14
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 15
        expect(json['path_serialized']).to eq one_road_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'AREAS' do
      before { post '/mazes/solve', params: areas }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 14
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 15
        expect(json['path_serialized']).to eq areas_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'DEAD ENDS' do
      before { post '/mazes/solve', params: dead_ends }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 14
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 15
        expect(json['path_serialized']).to eq dead_ends_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'EMPTY' do
      before { post '/mazes/solve', params: empty }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 14
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 15
        expect(json['path_serialized']).to eq empty_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'CYCLES' do
      before { post '/mazes/solve', params: cycles }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 16
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 17
        expect(json['path_serialized']).to eq cycles_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'MINI' do
      before { post '/mazes/solve', params: mini }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 1
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 2
        expect(json['path_serialized']).to eq mini_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'NO WALL' do
      before { post '/mazes/solve', params: no_wall }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 10
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 11
        expect(json['path_serialized']).to eq no_wall_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'UNREACHABLE PATHES' do
      before { post '/mazes/solve', params: unreachable_pathes }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 14
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 15
        expect(json['path_serialized']).to eq unreachable_pathes_solution
        expect(response).to have_http_status(200)
      end
    end
    context 'COMPLEX' do
      before { post '/mazes/solve', params: complex }
      it 'should return the solution with shortest path and steps' do
        expect(json['path_found']).to be true
        expect(json['path_length']).to eq 64
        expect(json['calculation_time']).not_to be nil
        expect(json['path_positions'].count).to eq 65
        expect(json['path_serialized']).to eq complex_solution
        expect(response).to have_http_status(200)
      end
    end
  end
end
