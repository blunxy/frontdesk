class BadgeManager

  def initialize(convention, cutoff_time)
    @convention = convention
    @cutoff_time = cutoff_time
  end


  def pre_badged_members
    @convention.attendees.select do |attendee|
      attendee.badge.printed_before?(@cutoff_time)
    end

  end

end
