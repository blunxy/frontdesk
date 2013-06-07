require 'services/current_attendees'

describe ExpressCheckIn do

  class Convention ; end
  class BulkBadgeManager ; end

  context "#with_preprinted_badges" do

    describe  "only contains members who have registered for the current convention AND who have had their badge bulk-printed" do

      Given(:bulk_badged_member_a) { stub('bbm_a') }
      Given(:not_bulk_badged_member_a) { stub('nbbm_a') }

      Given(:attendees_with_preprinted_badges) do
        [bulk_badged_member_a]
      end

      Given(:attendees_without_preprinted_badges) do
        [not_bulk_badged_member_a]
      end

      Given(:all_current_attendees) do
        attendees_with_preprinted_badges +
          attendees_without_preprinted_badges
      end

      Given do
        Convention.
          stub_chain(:current, :attendees).
          and_return(all_current_attendees)
      end

      Given do
        BulkBadgeManager.stub(:badged?).
          with(bulk_badged_member_a).
          and_return(true)
        BulkBadgeManager.stub(:badged?).
          with(not_bulk_badged_member_a).
          and_return(false)
      end

      When(:current_attendees) { CurrentAttendees.new }

      Then { current_attendees.with_preprinted_badges.should ==
        attendees_with_preprinted_badges }

    end

  end

end
