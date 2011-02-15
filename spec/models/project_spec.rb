require 'spec_helper'

describe Project do
  it "has to have name" do
    project = Project.new(:name => "")
    project.save.should == false
  end

  it "has many iterations" do
    project = Factory(:project, :name => "retro")
    project.iterations.should == []
  end
end
