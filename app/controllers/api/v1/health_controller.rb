class Api::V1::HealthController < ApplicationController
  def health
    render json: {message: "API OK"}
  end
end
