require 'spec_helper'

# Direct copy of code, not modification neccessary
# Source: http://www.jamiepenney.co.nz/2011/09/23/testing-content_for-in-rails-3-x-helpers-with-rspec/
# Author: http://www.jamiepenney.co.nz/about

describe ApplicationHelper do
  describe "title" do
    it "should call content_for(:title) with the title passed" do
      helper.title("title stuff")
      helper.content_for(:title).should == "title stuff"
    end
  end
end