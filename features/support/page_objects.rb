# frozen_string_literal: true

# PageObjects module to define the classes
module PageObjects
  def main
    MainClass.new
  end

  def verify_weather
    VerifyWeather.new
  end
end
