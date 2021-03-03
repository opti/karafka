# frozen_string_literal: true

module Karafka
  module Messages
    module Builders
      # Builder for creating batch metadata object based on the batch informations
      module BatchMetadata
        class << self
          # Creates metadata based on the kafka batch data
          # @param kafka_batch [Kafka::FetchedBatch] kafka batch details
          # @param topic [Karafka::Routing::Topic] topic for which we've fetched the batch
          # @return [Karafka::Messages::BatchMetadata] batch metadata object
          def call(kafka_batch, topic, scheduled_at)
            Karafka::Messages::BatchMetadata.new(
              size: kafka_batch.count,
              first_offset: kafka_batch.first.offset,
              last_offset: kafka_batch.last.offset,
              deserializer: topic.deserializer,
              partition: kafka_batch[0].partition,
              topic: topic.name,
              scheduled_at: scheduled_at
            ).freeze
          end
        end
      end
    end
  end
end
