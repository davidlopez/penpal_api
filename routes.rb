require 'sinatra'
require './poros/decision_maker'
require "sinatra/base"
require 'json'

get '/api/v1/suggestion' do
  json = JSON.parse(params['user_info'], symbolize_names: true)
  resource = DecisionMaker.get_suggestion(json)
  { type: resource.type, data: resource.data }.to_json
end
