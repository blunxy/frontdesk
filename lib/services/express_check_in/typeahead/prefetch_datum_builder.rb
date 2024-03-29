module ExpressCheckIn

  module Typeahead

    module PrefetchDatumBuilder

      extend self

      def build_from(attendee)
        @attendee = attendee
        build_hash
      end

      private

      def build_hash
        @hash = { }
        add_full_name_to_hash
        add_tokens_to_hash
        add_email_to_hash
        @hash
      end

      def add_full_name_to_hash
        @hash["value"] = "#{@attendee.first_name} #{@attendee.last_name}"
      end

      def add_tokens_to_hash
        tokens = []
        tokens << @attendee.first_name.downcase
        tokens << @attendee.last_name.downcase
        tokens << email_prefix
        tokens << email_suffix
        @hash["tokens"] = tokens
      end

      def add_email_to_hash
        @hash["email"] = @attendee.email
      end

      def email_prefix
        @attendee.email.match(/\A(\w+)@/)[1]
      end

      def email_suffix
        @attendee.email.match(/@(\w+)\./)[1]
      end



    end

  end

end
