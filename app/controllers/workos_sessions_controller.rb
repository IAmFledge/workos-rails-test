class WorkosSessionsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:create, :index]

  def create
    redirect_to ::Sessions::GetAuthUrl.new(domain: domain_param).call
  end

  def index
    profile = Sessions::GetProfileFromCode.new(code: code_param).call
    user = Sessions::GetUserFromProfile.new(profile: profile).call

    sign_in(:user, user)
    Sessions::SynchroniseProfile.new(profile: profile, user: user).call

    redirect_to root_url
  rescue ActionController::ParameterMissing
    flash.alert = workos_error_params
    redirect_to root_url
  end

  private

  def domain_param
    params.require(:domain)
  end

  def code_param
    params.require(:code)
  end

  def workos_error_params
    params.require(:error_description)
  end
end
