require 'services/badge_manager'

describe BadgeManager do

  let(:conference) { stub("conference") }
  let(:badge_manager) { BadgeManager.new(conference, stub) }
  let(:johns_badge) { stub(:printed_before? => true) }
  let(:janes_badge) { stub(:printed_before? => true) }
  let(:john) { stub("john", :badge => johns_badge) }
  let(:jane) { stub("jane", :badge => janes_badge) }


  describe "#bulk_badged_members" do

    it "only returns members with badges printed for a given conference" do
      conference.stub(:attendees => [john])
      some_other_conference = stub("some_other_conference",
                                   :attendees => [jane])

      badge_manager.bulk_badged_members.should include(john)
      badge_manager.bulk_badged_members.should_not include(jane)
    end

    it "only returns members with badges printed before the cutoff time" do
      janes_badge = stub(:printed_before? => false)
      jane = stub("jane", :badge => janes_badge)

      conference.stub(:attendees => [john, jane])

      badge_manager.bulk_badged_members.should include(john)
      badge_manager.bulk_badged_members.should_not include(jane)

    end

  end

end
