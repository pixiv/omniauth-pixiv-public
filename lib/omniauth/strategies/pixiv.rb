require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Pixiv < OmniAuth::Strategies::OAuth2
      RAW_INFO_URL = '/v1/me?include_email=1&include_profile=1&get_secure_url=1&profile_image_sizes=px_16x16,px_50x50,px_170x170'.freeze

      option :client_options, {
        site: 'https://public-api.secure.pixiv.net',
        authorize_url: 'https://oauth.secure.pixiv.net/v2/auth/authorize',
        token_url: 'https://oauth.secure.pixiv.net/v2/auth/token'
      }

      option :image_size, 'px_170x170'

      uid { raw_info['id'] }

      info do
        {
          id: raw_info['id'],
          email: raw_info['email'],
          account: raw_info['account'],
          nickname: raw_info['name'],
          avatar: raw_info.dig('profile_image_urls', options[:image_size])
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get(RAW_INFO_URL).parsed['response'].first
      end

      def authorize_params
        super.tap do |params|
          # Pass through request_type as part of oauth state parameter.
          state_with_request_type = "security_token=#{params[:state]},request_type=#{request.params['request_type'] || 'default'}"
          session['omniauth.state'] = params[:state] = request.params['state'] = state_with_request_type
        end
      end
    end
  end
end
