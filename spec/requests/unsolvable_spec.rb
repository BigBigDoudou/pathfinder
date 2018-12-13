require 'rails_helper'

RSpec.describe 'UNSOLVABLE MAZES', type: :request do
  describe 'POST /mazes/solve, when maze is valid and unsolvable' do
    context 'UNSOLVABLE 1' do
      before { post '/mazes/solve', params: unsolvable_1 }
      include_examples 'maze unsolvable'
    end
    context 'UNSOLVABLE 2' do
      before { post '/mazes/solve', params: unsolvable_2 }
      include_examples 'maze unsolvable'
    end
    context 'UNSOLVABLE 3' do
      before { post '/mazes/solve', params: unsolvable_3 }
      include_examples 'maze unsolvable'
    end
    context 'UNSOLVABLE 4' do
      before { post '/mazes/solve', params: unsolvable_4 }
      include_examples 'maze unsolvable'
    end
  end
end
