require 'services/express_check_in_manager'

module ExpressCheckIn

  describe ExpressCheckInManager do

    let(:registered_attendee) { stub("registered attendee") }
    let(:not_registered_attendee) { stub("not registered attendee") }
    let(:badged_attendee) { stub("badged attendee") }
    let(:non_badged_attendee) { stub("not badged attendee") }

    before(:each) do
      BadgeManager.stub_chain(:new, :pre_badged_members).
        and_return([badged_attendee])
    end


    #
    # ===== CONTEXT SWITCH =====
    #
    context "#non_registered_members" do

      it "returns all members not registered for the desired convention" do
        all_members = [registered_attendee, not_registered_attendee]
        Member.stub(:all => all_members)

        convention = stub("convention", :attendees => [registered_attendee])

        manager = ExpressCheckInManager.new(convention, stub("cutoff_time"))

        manager.non_registered_members.should == [not_registered_attendee]
      end

    end



    #
    # ===== CONTEXT SWITCH =====
    #
    context "#non_badged_members" do

      it "returns only registered members for a given con" do
        desired_con_registrant = stub("registrant in desired con")
        desired_convention = stub("desired_convention",
                                  :attendees => [desired_con_registrant])

        other_con_registrant = stub("registrant in other con")
        other_convention = stub("other_convention",
                                :attendees => [other_con_registrant])

        manager = ExpressCheckInManager.new(desired_convention,
                                            stub("cutoff_time"))
        manager.non_badged_members.should == [desired_con_registrant]

      end

      it "returns only those members without printed badges" do
        convention = stub("convention",
                          :attendees => [badged_attendee, non_badged_attendee])

        manager = ExpressCheckInManager.new(convention, stub("cutoff_time"))

        manager.non_badged_members.should == [non_badged_attendee]

      end

    end


    #
    # ===== CONTEXT SWITCH =====
    #
    context "#eligible_members" do

      it "only returns members registered in a convention" do
        convention = stub(:attendees => [registered_attendee])
        BadgeManager.stub_chain(:new, :pre_badged_members).
          and_return([registered_attendee])

        manager = ExpressCheckInManager.new(convention, stub("cutoff_time"))
        manager.eligible_members.should == [registered_attendee]
      end

      it "only returns members with pre-printed badges" do
        convention = stub("convention",
                          :attendees => [badged_attendee, non_badged_attendee])

        manager = ExpressCheckInManager.new(convention, stub("cutoff_time"))
        manager.eligible_members.should == [badged_attendee]

      end


    end

  end

end
