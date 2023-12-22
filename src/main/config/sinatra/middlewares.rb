# frozen_string_literal: true

require_relative "../../middlewares/sinatra/content_type"
require_relative "../../middlewares/sinatra/accept"
require_relative "../../middlewares/sinatra/cors"
require "sinatra/base"

module Main
  module Config
    class Middlewares < Sinatra::Base
      use Main::Middlewares::Sinatra::ContentTypeMiddleware
      use Main::Middlewares::Sinatra::AcceptMiddleware
      use Main::Middlewares::Sinatra::CorsMiddleware
    end
  end
end
