class WorkosSessionsController < ApplicationController
  def create
    redirect_uri = "#{ENV['APP_DOMAIN']}#{workos_sessions_path}"
    client_id = ENV['WORKOS_CLIENT_ID']

    redirect_to WorkOS::SSO.authorization_url(
      redirect_uri: redirect_uri,
      domain: workos_create_params,
      client_id: client_id
    )
  end

  def index
    client_id = ENV['WORKOS_CLIENT_ID']
    @profile = WorkOS::SSO.profile(
      code: workos_params,
      client_id: client_id
    )
  end

  private

  def workos_create_params
    params.require(:domain)
  end

  def workos_params
    params.require(:code)
  end
end
