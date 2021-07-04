# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_default_format

  private

  def set_default_format
    request.format = :json unless params[:format]
  end
end
