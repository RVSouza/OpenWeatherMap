# frozen_string_literal: true

# Class responsible to check the weather report from one location
class VerifyWeather < MainClass

  # Check weather data using the city name
  def verify_by_city_name(query, *optionals)
    url = base_url + add_parameter(ENDPOINTS['required']['q'], query)
    url = add_optional_parameters(url, optionals)
    HTTParty.get(url)
  end

  # Check weather data using the city id
  def verify_by_city_id(city_id, *optionals)
    url = base_url + add_parameter(ENDPOINTS['required']['id'], city_id)
    url = add_optional_parameters(url, optionals)
    HTTParty.get(url)
  end

  # Check weather data using the geographic coordinates (latitude and longitude)
  def verify_by_geographic_coordinates(latitude, longitude, *optionals)
    url = base_url + add_parameter(ENDPOINTS['required']['lat'], latitude) + add_parameter(ENDPOINTS['required']['lon'], longitude)
    url = add_optional_parameters(url, optionals)
    HTTParty.get(url)
  end

  # Check weather data using the zip code of the area
  def verify_by_zip_code(zip_code, *optionals)
    url = base_url + add_parameter(ENDPOINTS['required']['zip'], zip_code)
    url = add_optional_parameters(url, optionals)
    HTTParty.get(url)
  end

  ######## The methods below will be deprecated from 1st January 2022 ########

  # Check weather data from cities within a rectangle zone
  def verify_by_rectangle_zone(bbox, *optionals)
    url = base_url + add_parameter(ENDPOINTS['required']['bbox'], bbox)
    url = add_optional_parameters(url, optionals)
    HTTParty.get(url)
  end

  # Check weather data using the geographic coordinates (latitude and longitude) and cities laid within definite circle that is specified by center point
  def verify_cities_in_cicle(latitude, longitude, cnt, *optionals)
    url = base_url + add_parameter(ENDPOINTS['required']['lat'], latitude) + add_parameter(ENDPOINTS['required']['lon'], longitude) + add_parameter(ENDPOINTS['required']['cnt'], cnt)
    url = add_optional_parameters(url, optionals)
    HTTParty.get(url)
  end
end
