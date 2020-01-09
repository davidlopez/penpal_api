require 'spec_helper'
require './poros/decision_maker'
require 'json'
require 'dotenv'
Dotenv.load

RSpec.describe 'PenpalApi' do
  it 'receives a media suggestion request with user info', :vcr do
    response = get '/api/v1/suggestion', { user_info: {
      current_feeling: 'sad',
      feeling_preferences: ['sad', 'down'],
      resource_preferences: ['media'],
      media_preferences: { dogs: true, cats: false, animals: true, babies: false, celestial: false, landscapes: false } }.to_json }, { }

    expect(response).to be_successful
    expect(JSON.parse(response.body)).to be_a(Hash)
    expect(JSON.parse(response.body)).to have_key('type')
    expect(JSON.parse(response.body)).to have_key('data')
  end
end
