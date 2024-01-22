# frozen_string_literal: true

class Api::V1::StatusController < Api::ApiController
  def index
    render_ok(build_response)
  end

  private

  def build_response
    {
      status: :up,
      date: DateTime.current
    }
  end
end
