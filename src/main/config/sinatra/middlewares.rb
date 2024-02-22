# frozen_string_literal: true

require 'sinatra/base'
require_relative '../../middlewares/sinatra/content_type'
require_relative '../../middlewares/sinatra/accept'
require_relative '../../middlewares/sinatra/cors'

module Main
  module Config
    module SinatraMiddlewares
      class MiddlewaresSetup < Sinatra::Base
        use Main::Middlewares::Sinatra::ContentTypeMiddleware
        use Main::Middlewares::Sinatra::AcceptMiddleware
        use Main::Middlewares::Sinatra::CorsMiddleware
      end
    end
  end
end
