require './routes'
require 'dotenv'

Dotenv.load

run Sinatra::Application
