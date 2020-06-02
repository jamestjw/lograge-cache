# frozen_string_literal: true

require 'lograge/cache/version'

module Lograge
  # Main gem module
  module Cache
    class << self
      # Format Cache log
      attr_accessor :formatter
      # Extract information from Cache event
      attr_accessor :extract_event

      # Initialise configuration with fallback to default values
      def setup(config)
        Lograge::Cache.formatter     = config.formatter     || default_formatter
        Lograge::Cache.extract_event = config.extract_event || default_extract_event
      end

      def store
        defined?(RequestStore) ? RequestStore.store : Thread.current
      end

      private

      # By default, the output is a concatenated string of all extracted events
      def default_formatter
        proc do |cache_queries|
          cache_queries
        end
      end

      # By default, only extract values required for the default_formatter and
      # already convert to a string
      def default_extract_event
        proc do |event|
          {
            key: event.payload[:key],
            hit: event.payload[:hit],
            timestamp: event.time.utc
          }
        end
      end
    end
  end
end

# Rails specific configuration
require 'lograge/cache/railtie' if defined?(Rails)
