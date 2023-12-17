# frozen_string_literal: true

require "sinatra/base"
require_relative "../middlewares/body_parser"

module Main
  module Config
    class Middlewares < Sinatra::Base
      use Main::Middlewares::BodyParserMiddleware
    end
  end
end
