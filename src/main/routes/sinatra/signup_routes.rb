# frozen_string_literal: true

require_relative '../../adapters/sinatra/route_adapter'
require_relative '../../factories/sinatra/signup'

module SignupRoutes
  def self.registered(app)
    app.post '/signup' do
      return RouteAdapter.adapt(
        SignupFactory.create)
        .call(request, response)
        .body
    end
  end
end
