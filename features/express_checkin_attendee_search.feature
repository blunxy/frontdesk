Feature:
  I can quickly find attendees in the "express check-in" search box.

  The express check-in page has a search box.

  When you type something into this search box, it will autocomplete with
  attendee full names (first last) and the email used to register with
  myfallcon.com.

  This autocompletion is based on matches on first name, last name, the portion
  of the email before the '@' and the portion of the email after the '@' and
  before the final '.' These matches are case-insensitive.

  Attendees who have not registered yet should be tagged as <Not Registered>
  in the dropdown.

  Attendees who have registered *after* the bulk print time should be tagged
  as <Needs Badge> in the dropdown.

  Attendees who have made any changes that effects their pass (for example,
  to their schedule or chosen type of pass) should be tagged as <Badge Changed>
  in the dropdown.

  Otherwise, the attendee should be tagged as <OK> in the dropdown.



@javascript
Scenario:
  Only folks matching on first/last name or parts of the email should show up
  in the dropdown.

  Given an attendee "John Doe" with email "jd@example.com"
  And an attendee "Barb Jones" with email "barb@example.com"
  And an attendee "Gary Fredricks" with email "joho@example.com"
  And an attendee "Smitty Smitterson" with email "ss@johnson.com"
  And a bunch of attendees without matching names or emails
  When I search for "jo"
  Then the dropdown should contain all attendees with matching names and emails
  And the dropdown should not contain any of the other attendees



@javascript
Scenario:
  Not-registered folks should be tagged as Not Registered in the dropdown.

  Given a not-registered attendee "Bart Simpson" with email "bs@groenig.com"
  When I search for "si"
  Then the dropdown should contain "Bart Simpson" marked as not registered
