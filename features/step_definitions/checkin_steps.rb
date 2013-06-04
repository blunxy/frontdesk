def first_name(full_name)
  full_name.split[0]
end

def last_name(full_name)
  full_name.split[1]
end


Given(/^an attendee "(.*?)" with email "(.*?)"$/) do |full_name, email|

  @current_attendees = []
  @attendee = stub(:first_name => first_name(full_name),
                   :last_name => last_name(full_name),
                   :email => email)
  @current_attendees << @attendee
end

Given(/^a bunch of attendees without matching names or emails$/) do
  @current_attendees << stub(:first_name => "xc",
                             :last_name => "xx",
                             :email => "jx@example.com")
  @current_attendees << stub(:first_name => "xd",
                             :last_name => "xy",
                             :email => "jy@example.com")
  @current_attendees << stub(:first_name => "xe",
                             :last_name => "xz",
                             :email => "jz@example.com")

end

Given(/^some attendees containing "(.*?)" in their first names$/) do |first_name_part|
  @first_name_matching = stub(:first_name => "x#{first_name_part}y",
                             :last_name => "zz",
                             :email => "xy@example.com")

  @current_attendees << @first_name_matching
end

Given(/^some attendees containing "(.*?)" in their last names$/) do |last_name_part|
  @last_name_matching = stub(:last_name => "x#{last_name_part}y",
                             :first_name => "zz",
                             :email => "xy@example.com")

  @current_attendees << @last_name_matching
end

Given(/^some attendees containing "(.*?)" in their emails$/) do |email_part|
  @email_matching = stub(:last_name => "xy",
                         :first_name => "zz",
                         :email => "x#{email_part}y@example.com")

  @current_attendees << @email_matching
end

Given(/^I'm on the express check\-in page$/) do
  visit frontdesk_express_check_in_path
end


When(/^I search for "(.*?)"$/) do |search_term|
  fill_in "search_term", :with => search_term
  find("input#search_term").click
end

Then(/^the dropdown should contain all attendees with matching names and emails$/) do
  page.source.should have_css('p', :text => "jooble")
#  page.should have_css('p.email', :text => "jd@example.com")
end
