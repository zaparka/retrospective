Given /^the following iterations:$/ do |iterations|
  iterations.hashes.each do |item|
    item[:project] = Project.find_by_name(item[:project])
    Iteration.create!(item)
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) iteration$/ do |pos|
  visit project_path(Project.last)
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following iterations:$/ do |expected_iterations_table|
  expected_iterations_table.diff!(tableish('table tr', 'td,th'))
end
