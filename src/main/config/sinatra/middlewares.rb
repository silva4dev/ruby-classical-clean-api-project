# frozen_string_literal: true

require_relative "../../middlewares/sinatra/body_parser"
require "sinatra/base"

module Main
  module Config
    class Middlewares < Sinatra::Base
      use Main::Middlewares::Sinatra::BodyParserMiddleware
    end
  end
end
