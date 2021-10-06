#language: en

@check_weather
Feature: Check Weather Forecast

@check_by_valid_city_name
Scenario: Check by valid city name
    When I call the request that verify the city forecast by name: 'Delhi'
    Then the response code is '200'
    And returns the forecast data for the city

@check_by_invalid_city_name
Scenario: Check by invalid city name
    When I call the request that verify the city forecast by name with an invalid data
    Then the response code is '404'
    And returns the default not found response

@check_by_valid_city_id
Scenario: Check by valid city id
    When I call the request that verify the city forecast by id of 'Tokyo'
    Then the response code is '200'
    And returns the forecast data for the city

@check_by_invalid_city_id
Scenario: Check by invalid city id
    When I call the request that verify the city forecast by an invalid id 
    Then the response code is '404'
    And returns the default not found response

@check_by_valid_city_coordinates
Scenario: Check by valid city coordinates
    When I call the request that verify the city forecast by the coordinates of 'Belo Horizonte'
    Then the response code is '200'
    And returns the forecast data for the city

@check_by_invalid_city_coordinates
Scenario: Check by invalid city coordinates
    When I call the request that verify the city forecast by invalid coordinates 
    Then the response code is '400'
    And returns the invalid latitude/longitude response

@check_by_valid_city_zip_code
Scenario: Check by valid city zip code
    When I call the request that verify the city forecast by the zip code of 'New York'
    Then the response code is '200'
    And returns the forecast data for the city

@check_by_invalid_city_zip_code
Scenario: Check by invalid city zip code
    When I call the request that verify the city forecast by invalid zip code 
    Then the response code is '404'
    And returns the default not found response