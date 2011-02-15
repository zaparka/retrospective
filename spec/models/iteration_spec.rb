require 'spec_helper'

describe Iteration do
  it "belongs to project" do
    project = Factory(:project)
    it1 = Iteration.create(:name => "it1", :project => project)
    it1.project.should == project
  end

  it "has mandatory project id" do
    it1 = Iteration.new(:name => "it1")
    it1.save.should == false
  end
end
