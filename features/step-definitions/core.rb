require "open3"

When(/^I run the command: "(.*?)"$/) do |cmd|
  @stdout, @stderr, pid = Open3.capture3(cmd)
  @exitstatus = pid.exitstatus
end

Then(/^I want to see the following error:$/) do |string|
  @stderr.should include(string)  
end 

Then(/^the process should fail$/) do
  @exitstatus.should_not == 0
end

Then(/^I want the process to succeed$/) do
  @exitstatus.should == 0
end

Then(/^I want to see the following output$/) do |string|
  @stdout.should == string
end
