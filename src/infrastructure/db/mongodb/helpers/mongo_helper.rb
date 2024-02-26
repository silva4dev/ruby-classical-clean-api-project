# frozen_string_literal: true

require 'mongo'

module MongoHelper
  class << self
    @client = nil
    @uri = nil

    def connect(uri)
      @uri = uri
      @client = Mongo::Client.new(
        uri,
        options: {
          useNewUrlParser: true,
          useUnifiedTopology: true,
          connect_timeout: 5
        })
    end

    def disconnect
      @client&.close
      @client = nil
    end

    def get_collection(name)
      connect(@uri) unless connected?
      @client&.database&.collection(name)
    end

    def map(collection)
      collection_without_id = collection.except('_id')
      collection_without_id.merge('id' => collection['_id'])
    end

    def connected?
      !(@client.nil? || @client.cluster.nil? || @client.cluster.servers.empty?)
    end
  end
end
