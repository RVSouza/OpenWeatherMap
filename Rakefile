require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

# Rake tasks to execute the project

desc 'Execute check weather scenarios'
  task :default do
  puts 'Running all scenarios'
  sh 'cucumber'
end

desc 'Execute check weather scenarios'
  task :check_weather do
  puts 'Running check weather scenarios'
  sh 'cucumber -t @check_weather'
end

task :run_tag, [:tag] do |_task, args|
  puts "Running the scenarios that contain the tag #{args[:tag]}"
  sh "cucumber -t @#{args[:tag]} -p allure"
end

task :cucumber_report do
  puts "Open the cucumber html report"
  sh "open ./report/cucumber/report.html"
end

task :allure_report do
  puts "Create the report"
  sh "allure serve report/allure-results"
end