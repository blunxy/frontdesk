require 'services/badge_manager'

def first_name(full_name)
  full_name.split[0]
end

def last_name(full_name)
  full_name.split[1]
end


Given(/^an attendee "(.*?)" with email "(.*?)"$/) do |full_name, email|
  Attendee.create(:first_name => first_name(full_name),
                  :last_name => last_name(full_name),
                  :email => email)
  @full_names_to_match ||= []
  @full_names_to_match << full_name

  @emails_to_match ||= []
  @emails_to_match << email
end

Given(/^a bunch of attendees without matching names or emails$/) do
  Attendee.create(:first_name => "xc",
                  :last_name => "xx",
                  :email => "jx@example.com")

  Attendee.create(:first_name => "xc",
                  :last_name => "xy",
                  :email => "jy@example.com")

  Attendee.create(:first_name => "xe",
                  :last_name => "xz",
                  :email => "jz@example.com")

  @full_names_to_not_match = ["xc xx", "xc xy", "xe xz"]
  @emails_to_not_match = ["jx@example.com","jy@example.com", "jz@example.com" ]

end


When(/^I search for "(.*?)"$/) do |search_term|
  visit frontdesk_express_check_in_path
  fill_in "search_term", :with => search_term

  # need to do the following to trigger the Twitter Typeahead
  page.execute_script %Q{  $('input#search_term').trigger('focus'); }

end

Then(/^the dropdown should contain all attendees with matching names and
emails$/) do
  #p page.html
  @emails_to_match.each do  |email|
    page.source.should have_css('p', :text => email)
  end
  @full_names_to_match.each do |name|
    page.source.should have_css('p', :text => name)
  end
end

Then(/^the dropdown should not contain any of the other attendees$/) do
  @emails_to_not_match.each do |email|
    page.source.should_not have_css('p', :text => email)
  end
  @full_names_to_not_match.each do |name|
    page.source.should_not have_css('p', :text => name)
  end
end

Given(/^a pre\-badged attendee "(.*?)" with email "(.*?)"$/) do |name, email|
  attendee = Attendee.create(:first_name => first_name(name),
                  :last_name => last_name(name),
                  :email => email)
  conference = stub
  BadgeManager.new(conference).preprint_badge_for(attendee)
end

Given(/^attendee "(.*?)" with email "(.*?)" who missed the cutoff$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^the dropdown should contain "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the dropdown should not contain "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
