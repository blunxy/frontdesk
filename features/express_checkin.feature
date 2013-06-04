Feature: I can "express check-in" an attendee.

  As a front desk volunteer,

  I want to check in attendees quickly and painlessly

  So attendees can enjoy the con and I can stay sane.


Background:
  Given an attendee "John Doe" with email "jd@example.com"
  And a bunch of attendees without matching names or emails
  And some attendees containing "jo" in their first names
  And some attendees containing "jo" in their last names
  And some attendees containing "jo" in their emails
  And I'm on the express check-in page


@javascript
Scenario: Finding an attendee by case insensitive partial first name
  When I search for "jo"
  Then the dropdown should contain all attendees with matching names and emails
