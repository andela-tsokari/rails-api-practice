class ApplicationController < ActionController::API
  before_action :add_allow_credential_headers

  def add_allow_credential_headers
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin']\
    || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
end
