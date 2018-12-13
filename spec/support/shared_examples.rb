RSpec.shared_examples 'maze solved' do
  it 'should solve the maze' do
    expect(json['path_found']).to be true
    expect(json['calculation_time']).not_to be nil
    expect(response).to have_http_status(200)
  end
end

RSpec.shared_examples 'maze unsolvable' do
  it 'should not solve the maze' do
    expect(json['path_found']).to be false
    expect(json['error']).to eq 'unsolvable maze: finish can not be reached'
    expect(json['calculation_time']).not_to be nil
    expect(response).to have_http_status(200)
  end
end
