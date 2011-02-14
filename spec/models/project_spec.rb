require 'spec_helper'

describe Project do
  it "has to have name" do
    project = Project.new(:name => "")
    project.save.should == false
  end
end
