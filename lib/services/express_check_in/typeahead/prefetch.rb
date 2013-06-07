require_relative 'prefetch_datum_builder'

module ExpressCheckIn

  module Typeahead

    module Prefetch

      extend self

      def build_from(attendees)
        attendees.collect do |attendee|
          PrefetchDatumBuilder.build_from(attendee)
        end
      end

    end

  end

end
