# frozen_string_literal: true

class WeatherServiceHandler < ServiceBase
  def initialize(country, city = nil, state = nil)
    @location = [city, state, country].compact.join(',')

    @service = OpenWeatherMapService.new(@location)
  end

  def live_weather
    @service.current_weather
  end

  def minutely_weather
    @service.minutely_weather
  end

  def hourly_weather
    @service.hourly_weather
  end

  def daily_weather
    @service.daily_weather
  end

  def alerts_weather
    @service.alerts_weather
  end

  def all_weather
    @service.all_weather
  end
end
