require 'faraday'
require 'figaro'
require 'dotenv'
Dotenv.load

class PexelService
  def self.get_photo(pref)
    json = self.get_json(pref)
    { url: json[:photos].sample[:src][:large] }
  end

  private

    def self.connection(pref)
      Faraday.new(url: 'https://api.pexels.com/v1/search?') do |f|
        f.params[:query] = pref
        f.headers[:Authorization] = ENV['PEXEL_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(pref)
      response = self.connection(pref).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
