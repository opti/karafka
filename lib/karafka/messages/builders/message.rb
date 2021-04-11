# frozen_string_literal: true

module Karafka
  module Messages
    # Builders encapsulate logic related to creating messages related objects.
    module Builders
      # Builder of a single message based on raw rdkafka message.
      module Message
        class << self
          # @param kafka_message [Rdkafka::Consumer::Message] raw fetched message
          # @param topic [Karafka::Routing::Topic] topic for which this message was fetched
          # @return [Karafka::Messages::Message] message object with payload and metadata
          def call(kafka_message, topic)
            metadata = Karafka::Messages::Metadata.new(
              timestamp: kafka_message.timestamp,
              headers: kafka_message.headers,
              key: kafka_message.key,
              offset: kafka_message.offset,
              deserializer: topic.deserializer,
              partition: kafka_message.partition,
              topic: topic.name
            ).freeze

            Karafka::Messages::Message.new(
              kafka_message.payload,
              metadata
            )
          end
        end
      end
    end
  end
end