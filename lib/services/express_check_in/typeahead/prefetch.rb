module ExpressCheckIn

  module Typeahead

    class Prefetch

      def initialize(current_attendees)
        @attendees = current_attendees
      end


      def generate
        @attendees.collect do |attendee|
          PrefetchDatum.new(attendee)
        end
      end

    end

  end

end
