# frozen_string_literal: true

require 'sinatra/base'
require_relative '../../middlewares/sinatra/content_type'
require_relative '../../middlewares/sinatra/accept'
require_relative '../../middlewares/sinatra/cors'

class MiddlewaresSetup < Sinatra::Base
  use ContentTypeMiddleware
  use AcceptMiddleware
  use CorsMiddleware
end
