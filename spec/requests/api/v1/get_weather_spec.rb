# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::GetWeathers' do
  describe 'Get Weather Requests' do
    let(:request_payload) { json_fixture('get_weather_request_payload.json') }
    let(:geo_response_payload) { json_fixture('open_weather_api/geo_response_payload.json') }
    let(:weather_response_payload) { json_fixture('open_weather_api/weather_response_payload.json') }

    context 'when GET #show' do
      before do
        geo_url = ENV.fetch('OPEN_WEATHER_API_GEO_URL', nil)
        weather_url = ENV.fetch('OPEN_WEATHER_API_WEATHER_URL', nil)

        Typhoeus.stub(geo_url).and_return(Typhoeus::Response.new(code: 200, body: geo_response_payload.to_json))
        Typhoeus.stub(weather_url).and_return(Typhoeus::Response.new(code: 200, body: weather_response_payload.to_json))
      end

      it 'returns success with live data' do
        auth_get('/api/v1/get_weather', request_payload)

        expect(response.parsed_body[:result].key?('current')).to be(true)
      end
    end
  end
end
