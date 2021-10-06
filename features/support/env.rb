# frozen_string_literal: true

require 'allure-cucumber'
require 'cucumber'
require 'capybara'
require 'faker'
require 'httparty'
require 'json'
require 'jsonpath'
require 'json-schema'
require 'pry'
require 'report_builder'
require 'rspec'
require 'rubocop'
require 'yaml'

require_relative 'page_objects'

# Define the classes as global
World(PageObjects)

ENVIRONMENT_TYPE ||= ENV['ENVIRONMENT_TYPE']

# Create constants with data from files
path = File.dirname(__FILE__)
URL = YAML.load_file("#{path}/config/#{ENVIRONMENT_TYPE}.yml")
ENDPOINTS = YAML.load_file("#{path}/config/parameters.yml")
DATA = YAML.load_file("#{path}/data/data.yml")

# Default configuration for Allure report
AllureCucumber.configure do |c|
  c.clean_results_directory = false
  c.link_tms_pattern = 'https://example.org/tms/{}'
  c.link_issue_pattern = 'https://example.org/issue/{}'
  c.tms_prefix = 'TMS_'
  c.issue_prefix = 'ISSUE_'
end
