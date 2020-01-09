require './services/pexel_service'

class MediaResource
  attr_reader :type, :data

  def initialize(user_info)
    @type = 'media'
    @data = { url: get_media(user_info[:media_preferences]) }
  end

  def get_media(media_pref)
    PexelService.get_photo(media_pref.select { |k,v| v == true }.keys.sample)
  end
end
