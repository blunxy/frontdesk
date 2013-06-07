require 'frontdesk/current_attendees_controller'
require 'services/express_check_in'

module Frontdesk

  describe CurrentAttendeesController do

    describe "GET prefetch.json" do

      context "serves up attendees eligibile for express check-in"

      Then do
        ExpressCheckIn.
          should_receive(:eligible_members).and_call_original
        get :prefetch
      end

    end

  end


end
