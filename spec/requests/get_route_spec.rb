require 'rails_helper'

describe "get all parks route", :type => :request do
  let!(:parks) { FactoryBot.create_list(:park, 20)}

  before { get '/parks'}

  it 'returns all parks' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns 10 parks at a time' do
    get '/parks?page=1'
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end