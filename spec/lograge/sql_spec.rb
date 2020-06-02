# frozen_string_literal: true

require 'spec_helper'

describe Lograge::Cache do
  let(:subscriber) do
    if defined?(Lograge::RequestLogSubscriber)
      Lograge::RequestLogSubscriber
    else
      Lograge::LogSubscribers::ActionController
    end
  end

  it 'has a version number' do
    expect(Lograge::Cache::VERSION).not_to be nil
  end

  it 'extends lograge' do
    require 'lograge/cache/extension'

    expect(subscriber.new).to respond_to(:extract_cache_queries)
  end
end
