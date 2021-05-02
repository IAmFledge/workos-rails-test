module Sessions
  class GetProfileFromCode

    def initialize(params)
      @code = params[:code]
      @client_id = ENV['WORKOS_CLIENT_ID']
    end

    def call
      return nil unless @client_id && @code

      WorkOS::SSO.profile(
        code: @code,
        client_id: @client_id
      )
    end
  end
end
