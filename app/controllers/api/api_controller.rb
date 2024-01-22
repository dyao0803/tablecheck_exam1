# frozen_string_literal: true

class Api::ApiController < ApplicationController
  include ServiceExceptions

  def render_ok(data)
    build_resp(data)
  end

  # refer to https://gist.github.com/omrilotan/5867fb0a19c508691edfdd0660c75bc6 for render_<sym_code> reference
  Rack::Utils::SYMBOL_TO_STATUS_CODE.each do |symbol, code|
    define_method :"render_#{symbol}" do |data|
      build_resp(data, symbol, code)
    end
  end

  def default_response(title) # rubocop:disable Metrics/AbcSize
    OtelTracer.in_span(title) do |span|
      span.add_event(request.controller_class, attributes: params.as_json.with_indifferent_access)
      exec_time = Benchmark.measure do # rubocop:disable Style/ExplicitBlockArgument
        yield
      end

      span.add_attributes(build_otel_attributes(exec_time))
    end
  rescue ArgumentError, InvalidLocationError, InvalidRequestError => e
    render_bad_request(build_error_resp(e))
  rescue UnauthorizedError => e
    render_unauthorized(build_error_resp(e))
  rescue StandardError => e
    render_internal_server_error(build_error_resp(e))
  end

  private

  def build_otel_attributes(exec_time)
    {
      controller: params[:controller].to_s,
      method: request.method,
      status_code: response.status,
      execution_time: exec_time.real,
      response_body: response.body
    }.with_indifferent_access
  end

  def build_resp(data, status = :ok, code = 200)
    if [:ok].include?(status)
      success_resp(data, code)
    else
      fail_resp(data)
    end

    data[:params] = return_params
    data[:status_code] = code
    data[:status] = status

    render(status: status, json: data)
  end

  def success_resp(data, _code)
    data.merge!(success: true)
  end

  def fail_resp(data)
    data.merge!(success: false)
  end

  def build_error_resp(error)
    {
      message: error.message,
      trace: error.backtrace.first(10)
    }
  end

  def return_params
    payload = params.as_json.with_indifferent_access
    payload.select { |_, p| p unless p.is_a? Hash }
  end
end
