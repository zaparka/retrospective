require 'factory_girl'

Factory.define :project do |p|
  p.name { Factory.next(:project_name) }
end

Factory.define :iteration do |p|
  p.name { Factory.next(:iteration_name) }
  p.project {|a| a.association(:project) }
  p.start 2.day.ago
  p.end 2.days.from_now
end

Factory.sequence :iteration_name do |n|
  "Category #{n}"
end

Factory.sequence :project_name do |n|
  "Retrospective #{n}"
end
