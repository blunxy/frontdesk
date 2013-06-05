require 'services/express_check_in/typeahead/prefetch_datum'

module ExpressCheckIn::Typeahead

  describe PrefetchDatum do

    Given(:current_attendee) do
      stub(:first_name => "Bob",
           :last_name => "Hope",
           :email => "bh@example.com")
    end

    Given(:attendee_datum) { PrefetchDatum.new(current_attendee) }

    Then { attendee_datum["value"].should == "Bob Hope" }
    Then { attendee_datum["email"].should == "bh@example.com" }
    Then { attendee_datum["tokens"].should include("bob") }
    Then { attendee_datum["tokens"].should include("hope") }
    Then { attendee_datum["tokens"].should include("bh") }
    Then { attendee_datum["tokens"].should include("example") }

  end

end
