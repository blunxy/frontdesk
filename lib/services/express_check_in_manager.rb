require_relative 'badge_manager'

module ExpressCheckIn

  class ExpressCheckInManager

    def initialize(convention, badge_printing_cutoff_time)
      @convention = convention
      @badge_printing_cutoff_time = badge_printing_cutoff_time
      @attendees = convention.attendees
    end


    def eligible_members
      @attendees - non_badged_members
    end

    def non_registered_members
      Member.all - @attendees
    end

    def non_badged_members
      badge_manager = BadgeManager.new(@convention, @badge_printing_cutoff_time)
      @attendees - badge_manager.pre_badged_members
    end

  end

end
