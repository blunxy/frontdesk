require 'services/express_check_in/typeahead/prefetch'
require 'services/express_check_in/typeahead/prefetch_datum'

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

    Given(:prefetch) { Prefetch.new(current_attendees) }

    Then do
      PrefetchDatum.should_receive(:new).exactly(2).times
      prefetch.generate
    end

    Then {  prefetch.generate.size.should == 2 }

  end

end
