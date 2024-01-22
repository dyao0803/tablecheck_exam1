# frozen_string_literal: true

class OpenWeatherMapService < ServiceBase
  FREQUENCY = %i[
    current
    minutely
    hourly
    daily
    alerts
  ].freeze

  def initialize(location)
    @location = location
  end

  FREQUENCY.each do |freq|
    define_method :"#{freq}_weather" do
      build_weather([freq])
    end
  end

  def all_weather
    build_weather(FREQUENCY)
  end

  def lat_lon(return_raw: false)
    result = request(geo_url, params: build_geo_payload)

    raise raise InvalidLocationError, "Invalid Location: #{@location}" if result.empty?
    return result if return_raw

    {
      lat: result[:lat],
      lon: result[:lon],
      country: result[:country],
      localname: result[:local_names][:en]
    }
  end

  private

  def build_weather(exception)
    lat_lon_results = lat_lon
    exceptions = (FREQUENCY - exception).join(',')
    payload = build_weather_payload(lat_lon_results, exceptions)
    request(weather_url, params: payload)
  end

  def build_weather_payload(geo, exclude = '')
    {
      appid: key,
      exclude: exclude
    }.merge(geo.except(:country, :localname))
  end

  def build_geo_payload
    {
      appid: key,
      limit: 10,
      q: @location
    }
  end

  def key
    ENV.fetch('OPEN_WEATHER_API_KEY', nil)
  end

  def geo_url
    ENV.fetch('OPEN_WEATHER_API_GEO_URL', nil)
  end

  def weather_url
    ENV.fetch('OPEN_WEATHER_API_WEATHER_URL', nil)
  end
end
