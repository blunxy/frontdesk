require 'frontdesk/current_attendees_controller'
require 'services/express_check_in'

class Convention ; end


module Frontdesk

  describe CurrentAttendeesController do

    describe "GET prefetch.json" do

      context "should ask for eligible members" do

        Then do
          current_convention = stub('current_convention',
                                    :attendees => [])
          Convention.stub(:current => current_convention)
          ExpressCheckIn.
            should_receive(:eligible_members).
            with(current_convention).
            and_call_original
          get :prefetch
        end

      end

    end

  end

end
