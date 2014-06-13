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

Given(/^I have a feature that is "code complete"$/) do
  @fromStatusSlug = "code-complete"
end

Given(/^I have a feature that is "staged"$/) do
  @fromStatusSlug = "staged"
end

Given(/^I have a feature that is "in production"$/) do
  @fromStatusSlug = "prod"
end

Given(/^we are in the "(.*?)" environment$/) do |env|
  @env = env
end

def transitionCmd(fromStatusSlug, enabledSlug, env)
  cmd = "cat features/data/transitions/config.ttl features/data/transitions/#{fromStatusSlug}-#{enabledSlug}.ttl | feature-transition http://example.com/jira/ #{env}"
  print cmd
  Open3.capture3(cmd)
end

When(/^I enable the feature flag for that feature in this environment$/) do
  @stdout, @stderr, pid = transitionCmd(@fromStatusSlug, "enabled", @env)
  @exitstatus = pid.exitstatus
  @exitstatus.should == 0
end

When(/^I disable the feature flag for that feature in this environment$/) do
  @stdout, @stderr, pid = transitionCmd(@fromStatusSlug, "disabled", @env)
  @exitstatus = pid.exitstatus
  @exitstatus.should == 0
end


Then(/^the feature ticket should be marked "staged"$/) do
   contents = File.read File.expand_path("features/data/transitions/expected-staged.ttl")
   @stdout.should == contents
end

Then(/^the feature ticket should be marked "in production"$/) do
   contents = File.read File.expand_path("features/data/transitions/expected-in-production.ttl")
   @stdout.should == contents
end

Then(/^I want the feature ticket to remain unchanged$/) do
   contents = File.read File.expand_path("features/data/transitions/expected-unchanged.ttl")
   @stdout.should == contents
end
