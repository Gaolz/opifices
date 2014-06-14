require 'digest/md5'
class Console::BaseController < ApplicationController
  before_filter :authenticate
  layout 'console'

  private
  def authenticate
    authenticate_or_request_with_http_digest('Authorization') do |uname|
      CFG['admin_user'][uname]
    end
  end
end
