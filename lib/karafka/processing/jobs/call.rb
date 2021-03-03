# frozen_string_literal: true

module Karafka
  module Processing
    module Jobs
      # The main job type. It runs the executor that triggers given topic partition messages
      # processing in an underlying consumer instance
      class Call < Base
        # @param executor [Karafka::Processing::Executor] executor that is suppose to run a given
        #   job
        # @param messages [Array<dkafka::Consumer::Message>] array with raw rdkafka messages with
        #   which we are suppose to work
        # @return [Call]
        def initialize(executor, messages)
          @executor = executor
          @messages = messages
          @created_at = Time.now
        end

        # Runs the given executor
        def call
          executor.call(@messages, @created_at)
        end
      end
    end
  end
end
