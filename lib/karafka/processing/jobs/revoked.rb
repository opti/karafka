# frozen_string_literal: true

module Karafka
  module Processing
    module Jobs
      # Job that runs the revoked operation when we loose a partition
      class Revoked < Base
        # @param executor [Karafka::Processing::Executor] executor that is suppose to run a given
        #   job
        # @return [Revoked]
        def initialize(executor)
          @executor = executor
        end

        # Runs the revoking job via an executor
        def call
          executor.revoked
        end
      end
    end
  end
end
