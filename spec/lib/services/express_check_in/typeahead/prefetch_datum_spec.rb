require 'services/express_check_in/typeahead/prefetch_datum_builder'

module ExpressCheckIn::Typeahead

  describe PrefetchDatumBuilder do

    Given(:current_attendee) do
      stub(:first_name => "Bob",
           :last_name => "Hope",
           :email => "bh@example.com")
    end

    When(:datum) do
      PrefetchDatumBuilder.build_from(current_attendee)
    end

    Then { datum["value"].should == "Bob Hope" }
    Then { datum["email"].should == "bh@example.com" }
    Then { datum["tokens"].should include("bob") }
    Then { datum["tokens"].should include("hope") }
    Then { datum["tokens"].should include("bh") }
    Then { datum["tokens"].should include("example") }

  end

end
