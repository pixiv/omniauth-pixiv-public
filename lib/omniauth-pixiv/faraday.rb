require 'faraday'

module Omniauth
  module Pixiv
    module Faraday
      module Request
        autoload :UserAgent, 'omniauth-pixiv/faraday/request/user_agent'

        ::Faraday::Request.register_middleware user_agent: -> { UserAgent }
      end
    end
  end
end
