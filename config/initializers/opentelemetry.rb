require 'opentelemetry/sdk'
require 'opentelemetry/instrumentation/all'
OpenTelemetry::SDK.configure do |c|
  c.service_name = 'tablecheck'
end

OtelTracer = OpenTelemetry.tracer_provider.tracer('TableCheckTracer')