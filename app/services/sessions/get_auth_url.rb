module Sessions
  class GetAuthUrl
    include Rails.application.routes.url_helpers

    def initialize(params)
      @redirect_uri = "#{ENV['APP_DOMAIN']}#{workos_sessions_path}"
      @client_id = ENV['WORKOS_CLIENT_ID']
      @domain = params[:domain]
    end

    def call
      return nil unless @domain

      WorkOS::SSO.authorization_url(
        redirect_uri: @redirect_uri,
        domain: @domain,
        client_id: @client_id
      )
    end
  end
end
