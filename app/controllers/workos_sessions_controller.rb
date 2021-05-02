class WorkosSessionsController < ApplicationController
  def create
    redirect_to ::Sessions::GetAuthUrl.new(workos_create_params).call
  end

  def index
    client_id = ENV['WORKOS_CLIENT_ID']
    @profile = WorkOS::SSO.profile(
      code: workos_params,
      client_id: client_id
    )
  rescue ActionController::ParameterMissing
    flash.alert = workos_error_params
    redirect_to root_url
  end

  private

  def workos_create_params
    params.require(:domain)
  end

  def workos_params
    params.require(:code)
  end

  def workos_error_params
    params.require(:error_description)
  end
end
