class BadgeManager

  def initialize(conference, cutoff_time)
    @conference = conference
    @cutoff_time = cutoff_time
  end


  def bulk_badged_members
    @conference.attendees.select do |attendee|
      attendee.badge.printed_before?(@cutoff_time)
    end

  end

end
