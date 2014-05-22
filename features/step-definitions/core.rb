


When(/^I run the command: "(.*?)"$/) do |cmd|
  @output = `#{cmd}`
  @pid = $?
end

Then(/^I want to see the following error:$/) do |string|
  @output.should include(string)  
end 

Then(/^the process should fail$/) do
  @pid.exitstatus.should_not == 0
end

Then(/^I want the process to succeed$/) do
  @pid.exitstatus.should == 0
end
