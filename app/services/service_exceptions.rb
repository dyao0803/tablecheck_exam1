# frozen_string_literal: true

module ServiceExceptions
  class ServiceCustomError < ::StandardError
    def initialize(message = nil)
      err_msg = self.class.name.demodulize.underscore.humanize.camelcase.to_s
      err_msg += ": #{message}" unless message.nil?

      super(err_msg)
    end
  end

  class UnauthorizedError < ServiceCustomError; end
  class InvalidLocationError < ServiceCustomError; end
  class InvalidRequestError < ServiceCustomError; end
end
