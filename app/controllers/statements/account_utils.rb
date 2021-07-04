# frozen_string_literal: true

module Statements
  # module for don't use too much code
  module AccountUtils
    extend ActiveSupport::Concern

    private

    def set_account
      cpf = request.headers['cpf']
      @account = Account.find_by(cpf: cpf)
      render json: { message: 'Account not found' }, status: :not_found if @account.blank?
    end
  end
end
