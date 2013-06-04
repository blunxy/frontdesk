require 'services/typeahead_prefetch'
require 'rspec/given'

describe TypeaheadPrefetch do

  Given(:current_attendees) { [
                               stub(:first_name => "Bob",
                                    :last_name => "Hope",
                                    :email => "bh@example.com")
                              ]}

  Given(:prefetch) {
    TypeaheadPrefetch.create_from(current_attendees)
  }

  Then { prefetch.should == [
                             {
                               value: 'Bob Hope',
                               tokens: ['bob', 'hope', 'bh', 'example'],
                               email: "bh@example.com"
                             }
                            ]
  }


end
