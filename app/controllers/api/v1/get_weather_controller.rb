# frozen_string_literal: true

class Api::V1::GetWeatherController < Api::ApiController
  def show
    default_response('get_weather') do
      response = WeatherServiceHandler.new(*weather_params).try(:"#{request_type}_weather")
      raise InvalidRequestError if response.nil?

      render_ok({ result: response })
    end
  end

  private

  def weather_params
    permitted = params.permit(
      :country,
      :state,
      :city
    )

    [permitted[:country], permitted[:city], permitted[:state]]
  end

  def request_type
    permitted = params.permit(:type)
    result = permitted.values.first

    return result unless permitted.nil?

    raise InvalidRequestError, "Invalid Type: #{result}"
  end
end
