require 'services/express_check_in'

describe ExpressCheckIn do

  context "#eligible_members" do

    it "only returns members registered in a convention" do
      attending_members = [stub]
      convention = stub(:attendees => attending_members)
      ExpressCheckIn.eligible_members(convention).
        should == attending_members
    end

    it "only returns members with pre-printed badges"


  end

end
