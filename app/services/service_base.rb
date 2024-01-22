# frozen_string_literal: true

class ServiceBase
  include ServiceExceptions

  # Parameters
  # url:          string
  # kwargs
  ##    body:     hash
  ##    query:    hash
  ##    headers:  hash
  def request(url, **kwargs)
    resp = Typhoeus.get(url, **kwargs)
    raise UnauthorizedError, 'Invalid API authorization' if resp.response_code == 401

    response_handler(resp)
  end

  private

  def response_handler(resp)
    response = JSON.parse(resp.response_body)

    response = response.first if response.is_a? Array

    response.with_indifferent_access
  end
end
