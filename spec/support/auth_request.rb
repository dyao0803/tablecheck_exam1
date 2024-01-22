# frozen_string_literal: true

%i[get patch put post delete].each do |method|
  define_method "auth_#{method}" do |path, params = {}, headers = {}|
    new_headers = {
      # Authorization: "Authorization: #{session_token.key}"
    }.merge(headers)

    method != :post ? send(method, path, params:, headers: new_headers) :
      send(method, path, params:, headers: new_headers, as: :json)
  end
end
