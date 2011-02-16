require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Projects", %q{
  In order to create project
  as an user
  I want CRUD functionality for projects
} do

  scenario "Register new project" do
    visit new_project_path
    fill_in "Name", :with => "Thankerino"
    click_button "Create Project"

    page.should have_content('Project was successfully created.')
    current_url.should == project_url(Project.find_by_name("Thankerino"))
  end

  scenario "Updaate project" do
    project = Factory(:project, :name => "Thankerino")
    visit projects_url
    page.has_xpath?('.//table/tbody/tr/td', :text => "Thankerino")
    click_link "Edit"
    current_url.should == edit_project_url(project)

    fill_in "Name", :with => "Retrospective"
    click_button "Update Project"
    current_url.should == project_url(project)

    page.should have_content('Project was successfully updated.')
    page.should have_content('Retrospective')
    page.should have_no_content('Thankerino')
  end

  scenario "Delete project" do
    project1 = Factory(:project, :name => "Thankerino")
    project2 = Factory(:project, :name => "Retrospective")
    project3 = Factory(:project, :name => "Timesheets")
    project4 = Factory(:project, :name => "Osgood")

    visit projects_url
    page.has_xpath?('.//table/tbody/tr[1]/td', :text => "Thankerino")
    page.has_xpath?('.//table/tbody/tr[2]/td', :text => "Retrospective")
    page.has_xpath?('.//table/tbody/tr[3]/td', :text => "Timesheets")
    page.has_xpath?('.//table/tbody/tr[4]/td', :text => "Osgood")
    find(:xpath, './/table/tr[3]/td[4]/a', :text => "Destroy").click
    current_url.should == projects_url

    page.has_xpath?('.//table/tbody/tr[1]/td', :text => "Thankerino")
    page.has_xpath?('.//table/tbody/tr[2]/td', :text => "Retrospective")
    page.has_no_xpath?('.//table/tbody/tr[3]/td', :text => "Timesheets")
    page.has_xpath?('.//table/tbody/tr[4]/td', :text => "Osgood")
  end
end
