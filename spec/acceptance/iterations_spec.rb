require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Iterations", %q{
  In order to add iteration for project
  as a user
  I want CRUD functionality
} do

  scenario "Register new iteration" do
    project = Factory(:project, :name => "Retrospective")
    visit project_url(project)

    page.should have_content('Retrospective')
    click_link "New Iteration"
    current_url.should == new_project_iteration_url(project)

    fill_in "Name", :with => "IT 1"

    select "2011", :from => "iteration_start_1i"
    select "February", :from => "iteration_start_2i"
    select "5", :from => "iteration_start_3i"

    select "2011", :from => "iteration_end_1i"
    select "February", :from => "iteration_end_2i"
    select "25", :from => "iteration_end_3i"

    click_button "Create"
    page.should have_content('Iteration was successfully created.')
    current_url.should == project_iteration_url(project, Iteration.find_by_name("IT 1"))
  end

  scenario "Delete iteration" do
    project = Factory(:project, :name => "Thankerino")
    it1 = Factory(:iteration, :name => "it1", :project => project)
    it2 = Factory(:iteration, :name => "it2", :project => project)
    it3 = Factory(:iteration, :name => "it3", :project => project)
    it4 = Factory(:iteration, :name => "it4", :project => project)

    visit project_url(project)
    page.has_xpath?('.//table/tbody/tr[1]/td', :text => "it1")
    page.has_xpath?('.//table/tbody/tr[2]/td', :text => "it2")
    page.has_xpath?('.//table/tbody/tr[3]/td', :text => "it3")
    page.has_xpath?('.//table/tbody/tr[4]/td', :text => "it4")
    find(:xpath, './/table/tr[3]/td/a', :text => "Destroy").click
    current_url.should == project_url(project)

    page.has_xpath?('.//table/tbody/tr[1]/td', :text => "it1")
    page.has_xpath?('.//table/tbody/tr[2]/td', :text => "it2")
    page.has_no_xpath?('.//table/tbody/tr[3]/td', :text => "it3")
    page.has_xpath?('.//table/tbody/tr[4]/td', :text => "it4")
  end
end
