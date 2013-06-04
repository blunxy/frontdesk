require 'services/typeahead_prefetch_template'


describe TypeaheadPrefetchTemplate do

  Given(:current_attendee) do
    stub(:first_name => "Bob",
         :last_name => "Hope",
         :email => "bh@example.com")
  end

  Given(:templated_attendee) do
    TypeaheadPrefetchTemplate.new(current_attendee)
  end

  Given(:parsed_template) do
    JSON.parse(templated_attendee.to_json)
  end


  Then { parsed_template["value"].should == "Bob Hope" }
  Then { parsed_template["email"].should == "bh@example.com" }
  Then { parsed_template["tokens"].should include("bob") }
  Then { parsed_template["tokens"].should include("hope") }
  Then { parsed_template["tokens"].should include("bh") }
  Then { parsed_template["tokens"].should include("example") }

end
