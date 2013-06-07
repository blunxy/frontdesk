require 'services/express_check_in/typeahead/prefetch'
require 'services/express_check_in/typeahead/prefetch_datum_builder'

module ExpressCheckIn::Typeahead

  describe Prefetch do

    Given(:current_attendees) { [
                                 stub(:first_name => "Bob",
                                      :last_name => "Hope",
                                      :email => "bh@example.com"),
                                 stub(:first_name => "Jane",
                                      :last_name => "Doe",
                                      :email => "jd@example.com")
                                ]}

    Then do
      PrefetchDatumBuilder.should_receive(:build_from).
        exactly(2).times
      Prefetch.build_from(current_attendees)
    end

  end

end
