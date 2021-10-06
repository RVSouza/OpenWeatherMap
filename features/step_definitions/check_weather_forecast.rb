# frozen_string_literal: true

When(/^I call the request that verify the city forecast by name: '([^']*)'$/) do |city_name|
  @city_name = city_name
  @response = verify_weather.verify_by_city_name(city_name)
end

When(/^I call the request that verify the city forecast by name with an invalid data$/) do
  @invalid_data = Faker::JapaneseMedia::OnePiece.quote
  @response = verify_weather.verify_by_city_name(@invalid_data)
end

When(/^I call the request that verify the city forecast by id of '([^']*)'$/) do |city_name|
  @city_name = city_name
  @response = verify_weather.verify_by_city_id(DATA['city'][@city_name]['id'])
end

When(/^I call the request that verify the city forecast by an invalid id$/) do
  @invalid_data = Faker::Number.number(digits: 3)
  @response = verify_weather.verify_by_city_id(@invalid_data)
end

When(/^I call the request that verify the city forecast by the coordinates of '([^']*)'$/) do |city_name|
  @city_name = city_name
  @response = verify_weather.verify_by_geographic_coordinates(DATA['city'][@city_name]['latitude'], DATA['city'][@city_name]['longitude'])
end

When(/^I call the request that verify the city forecast by invalid coordinates$/) do
  @invalid_data = Faker::Number.number(digits: 10)
  @response = verify_weather.verify_by_geographic_coordinates(@invalid_data, @invalid_data)
end

When(/^I call the request that verify the city forecast by the zip code of '([^']*)'$/) do |city_name|
  @city_name = city_name
  @response = verify_weather.verify_by_zip_code(DATA['city'][@city_name]['zip_code'])
end

When(/^I call the request that verify the city forecast by invalid zip code$/) do
  @invalid_data = Faker::Number.number(digits: 20)
  @response = verify_weather.verify_by_zip_code(@invalid_data)
end

Then(/^the response code is '([^']*)'$/) do |status|
  expect(@response.code).to eql status.to_i
end

And(/^returns the forecast data for the city$/) do
  expect(@response['coord']['lon']).to be_between((DATA['city'][@city_name]['longitude'] - 150), (DATA['city'][@city_name]['longitude'] + 150)).inclusive
  expect(@response['coord']['lat']).to be_between((DATA['city'][@city_name]['latitude'] - 150), (DATA['city'][@city_name]['latitude'] + 150)).inclusive
  expect(@response['weather'][0]['id']).not_to be nil
  expect(@response['weather'][0]['main']).not_to be nil
  expect(@response['weather'][0]['description']).not_to be nil
  expect(@response['weather'][0]['icon']).not_to be nil
  expect(@response['base']).to eql 'stations'
  expect(@response['main']['temp']).not_to be nil
  expect(@response['main']['feels_like']).not_to be nil
  expect(@response['main']['temp_min']).not_to be nil
  expect(@response['main']['temp_max']).not_to be nil
  expect(@response['main']['pressure']).not_to be nil
  expect(@response['main']['humidity']).not_to be nil
  expect(@response['visibility']).not_to be nil
  expect(@response['wind']['speed']).not_to be nil
  expect(@response['wind']['deg']).not_to be nil
  expect(@response['clouds']['all']).not_to be nil
  expect(@response['dt']).not_to be nil
  unless @response['sys']['type'].nil?
    expect(@response['sys']['type']).not_to be nil
    expect(@response['sys']['id']).not_to be nil
  end
  expect(@response['sys']['country']).to eql DATA['city'][@city_name]['country']
  expect(@response['sys']['sunrise']).not_to be nil
  expect(@response['sys']['sunset']).not_to be nil
  expect(@response['timezone']).not_to be nil
  unless @response['id'].zero?
    expect(@response['id']).to eql DATA['city'][@city_name]['id']
  end
  expect(@response['name']).to eql DATA['city'][@city_name]['name']
  expect(@response['cod']).to eql @response.code
end

And(/^returns the default not found response$/) do
  expect(@response['cod']).to eql @response.code.to_s
  expect(@response['message']).to eql 'city not found'
end

And(/^returns the invalid latitude\/longitude response$/) do
  expect(@response['cod']).to eql @response.code.to_s
  expect(@response['message']).to match (/^(wrong (latitude|longitude)|Nothing to geocode)/)
end
