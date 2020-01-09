require_relative 'media_resource'

class DecisionMaker
  def self.get_suggestion(user_info)
    resource = user_info[:resource_preferences].sample
    Object.const_get(resource.capitalize + 'Resource').new(user_info)
  end
end
