
Given(/^I have feature flag called "testFlag" data without a ticket link$/) do 
  @testFile = "./features/data/withoutLink.ttl"
end

Given(/^I run the linter$/) do
  @output = `cat #{@testFile} | feature-lint`
  @pid = $?
end

Then(/^I want so see the the following error:$/) do |string|
  expect(@output).to include(string)
  @pid.exitstatus.should_not == 0
end

Given(/^I have feature flag called "(.*?)" data with a ticket link$/) do |arg1|
  @testFile = "./features/data/withLink.ttl"
end

Then(/^I don't see an error\.$/) do
  @pid.exitstatus.should == 0
end
