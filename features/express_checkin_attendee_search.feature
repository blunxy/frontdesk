Feature:
  I can quickly find attendees in the "express check-in"
  search box.

  The express check-in page has a search box.

  When you type something into this search box, it will autocomplete
  with attendee full names (first last) and the email used
  to register with myfallcon.com.

  This autocompletion is based on matches on first name, last name,
  the portion of the email before the '@' and the portion of the
  email after the '@' and before the final '.' These matches
  are case-insensitive.

  The only attendee info that should show up is for those attendees
  who have had their badges pre-printed. (So if they have
  registered *after* the bulk print date, they won't show up.)

  If the attendee has made any changes to their schedule or pass
  type since the bulk print, a warning must be shown so the
  front desk staff can tell them to get out of the express
  check-in.

Background:
  Given an attendee "John Doe" with email "jd@example.com"
  And an attendee "Barb Jones" with email "barb@example.com"
  And an attendee "Gary Fredricks" with email "joho@example.com"
  And an attendee "Smitty Smitterson" with email "ss@johnson.com"
  And a bunch of attendees without matching names or emails
  And I'm on the express check-in page

@javascript
Scenario:
  Only folks matching on first/last name or parts of the
  email should show up in the dropdown

  When I search for "fi"
  Then the dropdown should contain all attendees with matching names and emails
