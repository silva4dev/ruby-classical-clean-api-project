# frozen_string_literal: true

require_relative "../../../presentation/controllers/signup/signup_controller"
require_relative "../../config/sinatra/middlewares"
require_relative "../../adapters/sinatra/route_adapter"
require_relative "../../factories/sinatra/signup"

module Main
  module Routes
    module Sinatra
      class SignupRoutes < Main::Config::Middlewares
        post "/signup" do
          return Adapters::Sinatra::RouteAdapter.adapt(
            Factories::Sinatra::SignupFactory.create())
            .call(request, response)
            .body
        end
      end
    end
  end
end
